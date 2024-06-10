
resource "google_composer_environment" "iguana_composer_environment" {
  provider = google-beta
  name     = var.composer_name
  region   = var.region

  config {

    software_config {
      image_version            = "composer-${var.v_composer}-airflow-${var.v_airflow}"
      airflow_config_overrides = local.airflow_config
      pypi_packages            = local.package_config
      env_variables            = var.env_variables
    }

    resilience_mode = var.resilience_mode

    node_config {
      service_account = var.service_account

      network    = var.network
      subnetwork = var.subnetwork
    }

    workloads_config {
      triggerer {
        count     = var.triggerer_count
        memory_gb = var.triggerer_memory_gb
        cpu       = var.triggerer_cpu
      }
      scheduler {
        cpu        = var.scheduler_cpu
        memory_gb  = var.scheduler_memory_gb
        storage_gb = var.scheduler_storage_gb
        count      = var.scheduler_count
      }
      web_server {
        cpu        = var.web_server_cpu
        memory_gb  = var.web_server_memory_gb
        storage_gb = var.web_server_storage_gb
      }
      worker {
        cpu        = var.worker_cpu
        memory_gb  = var.worker_memory_gb
        storage_gb = var.worker_storage_gb
        min_count  = var.worker_min_count
        max_count  = var.worker_max_count
      }
    }

    environment_size = var.environment_size
  }
}

resource "google_storage_bucket" "ml_bucket" {
  count    = var.create_ml_bucket ? 1 : 0
  name     = "iguana-ml-${var.environment_with_dash}"
  location = var.ml_bucket_region
}

