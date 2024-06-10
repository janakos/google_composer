variable "region" {
  type        = string
  default     = "us-central1"
  description = "The region this environment should be deployed into."
}

variable "composer_name" {
  type        = string
  default     = "iguana-stage"
  description = "The name to be given to the Composer environment itself."
}

variable "environment_with_dash" {
  type        = string
  description = "The Airflow Variable `environment_with_dash` that will be used for this environment."
}

variable "network" {
  type        = string
  description = "Self-link of the VPC network where the GKE cluster will be created. Leave it null for Auto-mode VPCs"
  default     = null
}

variable "subnetwork" {
  type        = string
  description = "Self-link of the VPC subnetwork where the GKE cluster will be created. Leave it null for Auto-mode VPCs"
  default     = null
}

variable "ml_bucket_region" {
  type        = string
  description = "Region of the GCS bucket for this environment."
  default     = "us"
}

variable "service_account" {
  type        = string
  description = "The service account to operate on behalf of the environment."
}

# Toggles
variable "create_ml_bucket" {
  default     = false
  type        = bool
  description = "If `true`, create an ml bucket for this environment."
}

# Config Overrides
variable "config_overrides" {
  default     = {}
  type        = map(string)
  description = "Any configuration options to add alongside the defaults."
}

variable "env_variables" {
  description = "A map of environment variables to be imported into the environment."
  type        = map(string)
  default     = {}
}

variable "package_overrides" {
  default     = {}
  type        = map(string)
  description = "A map of packages to override the default configuration with"
}

variable "v_composer" {
  type        = string
  description = "Version of Cloud Composer to be using."
  default     = "2.6.5"
}

variable "v_airflow" {
  type        = string
  description = "Version of Airflow to be using."
  default     = "2.7.3"
}

variable "environment_size" {
  type        = string
  description = "The size of the environment as specified by Cloud Composer's options."
  default     = "ENVIRONMENT_SIZE_LARGE"
}

# Scheduler Config
variable "scheduler_cpu" {
  type        = number
  description = "Number of scheduler CPUs."
  default     = 28
}
variable "scheduler_memory_gb" {
  type        = number
  description = "How much memory the scheduler should have in GB."
  default     = 28
}
variable "scheduler_storage_gb" {
  type        = number
  description = "How much disk the scheduler should have in GB."
  default     = 10
}
variable "scheduler_count" {
  type        = number
  description = "Number of schedulers to deploy."
  default     = 4
}

# Triggerer config
variable "triggerer_count" {
  description = "The number of triggerers for this environments."
  default     = 2
  type        = number
}

variable "triggerer_memory_gb" {
  description = "The memory in GB per triggerer in this environment."
  default     = 1
  type        = number
}
variable "triggerer_cpu" {
  description = "The number of CPUs per triggerer in this environment."
  default     = 1
  type        = number
}


# Webserver Config
variable "web_server_cpu" {
  type        = number
  description = "Number of CPUs for the web server."
  default     = 16
}
variable "web_server_memory_gb" {
  type        = number
  description = "Amount of memory for the web server in GB."
  default     = 32
}
variable "web_server_storage_gb" {
  type        = number
  description = "Amount of disk for the web server in GB."
  default     = 10
}


# Worker Config
variable "worker_cpu" {
  type        = number
  description = "Number of worker CPUs."
  default     = 16
}
variable "worker_memory_gb" {
  type        = number
  description = "Amount of worker memory in GB."
  default     = 64
}
variable "worker_storage_gb" {
  type        = number
  description = "Amount of worker disk in GB."
  default     = 10
}
variable "worker_min_count" {
  type        = number
  description = "Minimum number of workers to scale down to."
  default     = 4
}
variable "worker_max_count" {
  type        = number
  description = "Max number of workers to scale up to."
  default     = 12
}

variable "packages" {
  type        = map(string)
  description = "Base Python packages to be installed in the environment."
  default = {
    anticaptchaofficial             = "==1.0.26"
    apache-airflow-providers-slack  = "[http]==4.2.1"
    apache-airflow-providers-amazon = "==7.2.1"
    astronomer-providers            = "==1.18.0"
    attrs                           = ">=19.2.0"
    base58                          = ""
    base58check                     = ""
    beautifulsoup4                  = "==4.7.1"
    bs4                             = "==0.0.1"
    cashaddress                     = ""
    coinaddrng                      = ">=1.1.1"
    crc32c                          = "==2.3.post0"
    elasticsearch                   = "==7.13.1"
    google-cloud-bigquery           = "==3.4.0"
    graphframes                     = "==0.6"
    jsonlines                       = ""
    networkx                        = ""
    openpyxl                        = "==3.0.10"
    paramiko                        = ""
    pycryptodome                    = "==3.9.8"
    pydash                          = ""
    pyfarmhash                      = ""
    pypdf2                          = "==3.0.1"
    pyspark                         = "==3.2.2"
    pyswip                          = "==0.2.10"
    scikit-learn                    = "==1.3.0"
    scraperapi-sdk                  = "==0.2.2"
    scrapy                          = "==2.11.1"
    scrapy-zyte-api                 = "==0.8.1"
    slackclient                     = "==1.3.1"
    sshtunnel                       = ""
    telethon                        = "==1.26.1"
    twisted                         = "==22.4.0"
    unionfind                       = ""
    webhoseio                       = "==0.5"
    xlrd                            = ""
  }
}

variable "resilience_mode" {
  type        = string
  description = "Set the resilience mode of this environment."
  default     = "STANDARD_RESILIENCE"
}


variable "airflow_config" {
  type        = map(string)
  description = "Default Airflow configuration options."
  default = {
    core-parallelism                           = "500"
    core-max_active_runs_per_dag               = "1"
    core-max_active_tasks_per_dag              = "250"
    core-dagbag_import_timeout                 = "599"
    core-dag_file_processor_timeout            = "600"
    core-dags_are_paused_at_creation           = "True"
    database-load_default_connections          = "False"
    scheduler-catchup_by_default               = "False"
    scheduler-scheduler_zombie_task_threshold  = "3600"
    scheduler-parsing_processes                = "32"
    scheduler-task_queued_timeout              = "1200"
    scheduler-min_file_process_interval        = "600"
    scheduler-dag_dir_list_interval            = "600"
    scheduler-max_dagruns_per_loop_to_schedule = "20"
    scheduler-scheduler_health_check_threshold = "240"
    celery-worker_concurrency                  = "40"
    webserver-rbac_user_registration_role      = "User"
    webserver-instance_name                    = "staging"
    webserver-workers                          = "4"
    webserver-show_trigger_form_if_no_params   = "True"
  }
}

