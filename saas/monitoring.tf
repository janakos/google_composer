locals {
  # `gke_cluster` is a self_link to the underlying GKE cluster. Split the URL path
  # into the appropriate components to be passed into the gke_auth module
  shards           = split("/", google_composer_environment.iguana_composer_environment.config.0.gke_cluster)
  gke_cluster_name = local.shards[5]
  gke_location     = local.shards[3]
}

data "google_project" "this" {}

# This google-maintained module produces the necessary bits to configure the kubernetes/helm
# providers.
module "gke_auth" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/auth"

  project_id   = data.google_project.this.number
  cluster_name = local.gke_cluster_name
  location     = local.gke_location

  version = "v26.1.1"
}

# Configuring providers in modules is usually frowned upon. Doing so will make this module
# incompatible with count/for_each. It is still probably the best solution we have at this
# point in time. For more context into why this is the case, please check
# https://github.com/hashicorp/terraform/issues/24476
provider "kubernetes" {
  cluster_ca_certificate = module.gke_auth.cluster_ca_certificate
  host                   = module.gke_auth.host
  token                  = module.gke_auth.token
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = module.gke_auth.cluster_ca_certificate
    host                   = module.gke_auth.host
    token                  = module.gke_auth.token
  }
}

resource "kubernetes_namespace" "opentelemetry" {
  metadata {
    name = "opentelemetry"
  }
}

# This secret must already exist in the project. At the time of this writing,
# it is expected to be created by the "core-monitoring" stack for the current
# project
data "google_secret_manager_secret_version" "newrelic_ingestion_key" {
  secret = "new-relic-ingestion-key"
}

resource "helm_release" "opentelemetry-collector" {
  name       = "collector"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart      = "opentelemetry-collector"
  namespace  = kubernetes_namespace.opentelemetry.metadata.0.name

  values = [
    templatefile("${path.module}/values.yaml.tftpl", {
      newrelic_ingestion_key = data.google_secret_manager_secret_version.newrelic_ingestion_key.secret_data
      composer_name          = var.composer_name
    })
  ]
}
