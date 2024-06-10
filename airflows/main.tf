
data "google_service_account" "iguana_composer_service_account" {
  account_id = "iguana-composer-production"
}

module "iguana-prod-primary-v6" {
  source = "../saas"

  composer_name         = "iguana-prod-primary-v6"
  environment_with_dash = "iguana-prod-primary-v6"
  service_account       = data.google_service_account.iguana_composer_service_account.name

  # Config overrides
  config_overrides = {
    webserver-instance_name             = "prod-primary-v6"
    webserver-workers                   = 36
    scheduler-dag_dir_list_interval     = null
    scheduler-min_file_process_interval = 300
  }

  # Resource settings
  worker_memory_gb = 80

  env_variables = {
    AIRFLOW_DATA_EXTRACT_BUCKET_PATH = "gs://iguana-prod-extracts"
    ENVIRONMENT_TYPE                 = "prod"
    IS_iguana_SAAS                      = "True"
  }
}

module "iguana-prod-load-v3" {
  source = "../saas"

  composer_name         = "iguana-prod-load-v3"
  environment_with_dash = "iguana-prod-load-v3"
  service_account       = data.google_service_account.iguana_composer_service_account.name

  # Config overrides
  config_overrides = {
    webserver-instance_name = "prod-load-v3"
    webserver-workers       = 36
  }

  # Resource settings
  worker_memory_gb = 80

  env_variables = {
    FORCE_RESTART_20240409           = "True"
    AIRFLOW_DATA_EXTRACT_BUCKET_PATH = "gs://iguana-prod-extracts"
    AIRFLOW_SERVING_INTEGRATION_MODE = "True"
    ENVIRONMENT_TYPE                 = "prod"
    IS_iguana_SAAS                      = "True"
  }
}

module "iguana-prod-latest-v5" {
  source = "../saas"

  composer_name         = "iguana-prod-latest-v5"
  environment_with_dash = "prod-v5"
  service_account       = data.google_service_account.iguana_composer_service_account.name

  # Config overrides
  config_overrides = {
    webserver-instance_name             = "prod-latest-v5"
    webserver-workers                   = 24
    celery-worker_concurrency           = 32
    scheduler-dag_dir_list_interval     = null
    scheduler-min_file_process_interval = 300
  }

  # Resource settings
  worker_memory_gb = 32
  worker_min_count = 6

  env_variables = {
    AIRFLOW_LATEST_MODE              = "TRUE"
    ENVIRONMENT_TYPE                 = "prod"
    IS_iguana_SAAS                      = "True"
    AIRFLOW_DATA_EXTRACT_BUCKET_PATH = "gs://iguana-prod-extracts"
  }
}

module "iguana-prod-secondary-v3" {
  source = "../saas"

  composer_name         = "iguana-prod-secondary-v3"
  environment_with_dash = "iguana-prod-secondary-v3"
  service_account       = data.google_service_account.iguana_composer_service_account.name

  # Config overrides
  config_overrides = {
    webserver-instance_name = "prod-secondary-v3"
    webserver-workers       = 24
  }

  # Resource settings
  worker_memory_gb = 80

  env_variables = {
    ENVIRONMENT_TYPE                 = "prod"
    IS_iguana_SAAS                      = "True"
    AIRFLOW_DATA_EXTRACT_BUCKET_PATH = "gs://iguana-prod-extracts"
  }
}
