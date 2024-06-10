// GCP config
terraform {

  backend "gcs" {
    bucket = "iguana-tf-state-iguana"
    prefix = "iguana/airflow/terraform/gcp-us-central1/iguana/airflows"
  }

  required_version = "~> 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = local.project_id
  region  = local.region
  zone    = "${local.region}-${local.zone}"
}

provider "google-beta" {
  project = local.project_id
  region  = local.region
  zone    = "${local.region}-${local.zone}"
}


