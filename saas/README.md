# Graph view
The output below is a render of Terraform graph to Mermaid's syntax. By rendering the output from Terraform graph into a
visual representation, it becomes easier to understand and analyze the complex relationships and dependencies between
infrastructure resources. This visualization enables engineers to gain a comprehensive view of their infrastructure and
identify potential bottlenecks, circular dependencies, or areas for optimization.

```mermaid
%%tfmermaid
%%{init:{"theme":"default","themeVariables":{"lineColor":"#6f7682","textColor":"#6f7682"}}}%%
flowchart LR
classDef r fill:#5c4ee5,stroke:#444,color:#fff
classDef v fill:#eeedfc,stroke:#eeedfc,color:#5c4ee5
classDef ms fill:none,stroke:#dce0e6,stroke-width:2px
classDef vs fill:none,stroke:#dce0e6,stroke-width:4px,stroke-dasharray:10
classDef ps fill:none,stroke:none
classDef cs fill:#f7f8fa,stroke:#dce0e6,stroke-width:2px
subgraph "n0"["Cloud Platform"]
n1{{"data.google_project.this"}}:::r
end
class n0 cs
subgraph "n2"["Secret Manager"]
n3{{"data.<br/>google_secret_manager_secret_version.<br/>newrelic_ingestion_key"}}:::r
end
class n2 cs
subgraph "n4"["Cloud Composer"]
n5["google_composer_environment.<br/>iguana_composer_environment"]:::r
end
class n4 cs
n6(["local.airflow_config"]):::v
n7(["local.package_config"]):::v
subgraph "n8"["Input Variables"]
n9(["var.composer_name"]):::v
na(["var.env_variables"]):::v
nb(["var.environment_size"]):::v
nc(["var.network"]):::v
nd(["var.region"]):::v
ne(["var.scheduler_count"]):::v
nf(["var.scheduler_cpu"]):::v
ng(["var.scheduler_memory_gb"]):::v
nh(["var.scheduler_storage_gb"]):::v
ni(["var.service_account"]):::v
nj(["var.subnetwork"]):::v
nk(["var.v_airflow"]):::v
nl(["var.v_composer"]):::v
nm(["var.web_server_cpu"]):::v
nn(["var.web_server_memory_gb"]):::v
no(["var.web_server_storage_gb"]):::v
np(["var.worker_cpu"]):::v
nq(["var.worker_max_count"]):::v
nr(["var.worker_memory_gb"]):::v
ns(["var.worker_min_count"]):::v
nt(["var.worker_storage_gb"]):::v
nu(["var.create_ml_bucket"]):::v
nv(["var.environment_with_dash"]):::v
nw(["var.ml_bucket_region"]):::v
nx(["var.airflow_config"]):::v
ny(["var.config_overrides"]):::v
nz(["var.package_overrides"]):::v
n10(["var.packages"]):::v
end
class n8 vs
subgraph "n11"["Cloud Storage"]
n12["google_storage_bucket.<br/>ml_bucket"]:::r
end
class n11 cs
n13["helm_release.<br/>opentelemetry-collector"]:::r
subgraph "n14"["core/v1"]
n15["kubernetes_namespace.<br/>opentelemetry"]:::r
end
class n14 cs
n16(["local.gke_cluster_name"]):::v
n17(["local.shards"]):::v
n18(["local.gke_location"]):::v
subgraph "n19"["module.gke_auth"]
subgraph "n19_padding"[" "]
subgraph "n1a"["Cloud Platform"]
n1b{{"data.<br/>google_client_config.<br/>provider"}}:::r
end
class n1a cs
subgraph "n1c"["Kubernetes (Container) Engine"]
n1d{{"data.<br/>google_container_cluster.<br/>gke_cluster"}}:::r
end
class n1c cs
subgraph "n1e"["Input Variables"]
n1f(["var.cluster_name"]):::v
n1g(["var.location"]):::v
n1h(["var.project_id"]):::v
n1i(["var.use_private_endpoint"]):::v
end
class n1e vs
n1j(["local.cluster_ca_certificate"]):::v
n1k(["local.context"]):::v
n1l(["local.default_endpoint"]):::v
n1m(["local.endpoint"]):::v
n1n(["local.private_endpoint"]):::v
n1o(["local.host"]):::v
subgraph "n1p"["Output Values"]
n1q(["output.cluster_ca_certificate"]):::v
n1r(["output.host"]):::v
n1s(["output.kubeconfig_raw"]):::v
n1t(["output.token"]):::v
end
class n1p vs
end
class n19_padding ps
end
class n19 ms
n6-->n5
n7-->n5
n9--->n5
na--->n5
nb--->n5
nc--->n5
nd--->n5
ne--->n5
nf--->n5
ng--->n5
nh--->n5
ni--->n5
nj--->n5
nk--->n5
nl--->n5
nm--->n5
nn--->n5
no--->n5
np--->n5
nq--->n5
nr--->n5
ns--->n5
nt--->n5
nu--->n12
nv--->n12
nw--->n12
n3-->n13
n15-->n13
nx--->n6
ny--->n6
n17-->n16
n17-->n18
nz--->n7
n10--->n7
n5-->n17
n1f-->n1d
n1g-->n1d
n1h-->n1d
n1d-->n1j
n1d-->n1k
n1d-->n1l
n1l-->n1m
n1n-->n1m
n1i-->n1m
n1m-->n1o
n1d-->n1n
n1j-->n1q
n1o-->n1r
n1b-->n1s
n1j-->n1s
n1k-->n1s
n1m-->n1s
n1b-->n1t
n16-->n1f
n18-->n1g
n1-->n1h
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.10.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 4 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.10.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.21.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke_auth"></a> [gke\_auth](#module\_gke\_auth) | terraform-google-modules/kubernetes-engine/google//modules/auth | v26.1.1 |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_composer_environment.iguana_composer_environment](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_composer_environment) | resource |
| [google_storage_bucket.ml_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [helm_release.opentelemetry-collector](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.opentelemetry](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_secret_manager_secret_version.newrelic_ingestion_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airflow_config"></a> [airflow\_config](#input\_airflow\_config) | Default Airflow configuration options. | `map(string)` | <pre>{<br>  "celery-worker_concurrency": "40",<br>  "core-dag_file_processor_timeout": "600",<br>  "core-dagbag_import_timeout": "599",<br>  "core-dags_are_paused_at_creation": "True",<br>  "core-max_active_runs_per_dag": "1",<br>  "core-max_active_tasks_per_dag": "250",<br>  "core-parallelism": "500",<br>  "database-load_default_connections": "False",<br>  "scheduler-catchup_by_default": "False",<br>  "scheduler-max_dagruns_per_loop_to_schedule": "20",<br>  "scheduler-min_file_process_interval": "600",<br>  "scheduler-parsing_processes": "32",<br>  "scheduler-scheduler_health_check_threshold": "240",<br>  "scheduler-scheduler_zombie_task_threshold": "3600",<br>  "scheduler-task_queued_timeout": "1200",<br>  "webserver-instance_name": "staging",<br>  "webserver-rbac_user_registration_role": "User",<br>  "webserver-show_trigger_form_if_no_params": "True",<br>  "webserver-workers": "4"<br>}</pre> | no |
| <a name="input_composer_name"></a> [composer\_name](#input\_composer\_name) | The name to be given to the Composer environment itself. | `string` | `"iguana-stage"` | no |
| <a name="input_config_overrides"></a> [config\_overrides](#input\_config\_overrides) | Any configuration options to add alongside the defaults. | `map(string)` | `{}` | no |
| <a name="input_create_ml_bucket"></a> [create\_ml\_bucket](#input\_create\_ml\_bucket) | If `true`, create an ml bucket for this environment. | `bool` | `false` | no |
| <a name="input_env_variables"></a> [env\_variables](#input\_env\_variables) | A map of environment variables to be imported into the environment. | `map(string)` | `{}` | no |
| <a name="input_environment_size"></a> [environment\_size](#input\_environment\_size) | The size of the environment as specified by Cloud Composer's options. | `string` | `"ENVIRONMENT_SIZE_LARGE"` | no |
| <a name="input_environment_with_dash"></a> [environment\_with\_dash](#input\_environment\_with\_dash) | The Airflow Variable `environment_with_dash` that will be used for this environment. | `string` | n/a | yes |
| <a name="input_ml_bucket_region"></a> [ml\_bucket\_region](#input\_ml\_bucket\_region) | Region of the GCS bucket for this environment. | `string` | `"us"` | no |
| <a name="input_network"></a> [network](#input\_network) | Self-link of the VPC network where the GKE cluster will be created. Leave it null for Auto-mode VPCs | `string` | `null` | no |
| <a name="input_package_overrides"></a> [package\_overrides](#input\_package\_overrides) | A map of packages to override the default configuration with | `map(string)` | `{}` | no |
| <a name="input_packages"></a> [packages](#input\_packages) | Base Python packages to be installed in the environment. | `map(string)` | <pre>{<br>  "anticaptchaofficial": "==1.0.26",<br>  "apache-airflow-providers-amazon": "==7.2.1",<br>  "apache-airflow-providers-slack": "[http]==4.2.1",<br>  "astronomer-providers": "==1.18.0",<br>  "attrs": ">=19.2.0",<br>  "base58": "",<br>  "base58check": "",<br>  "beautifulsoup4": "==4.7.1",<br>  "bs4": "==0.0.1",<br>  "cashaddress": "",<br>  "coinaddrng": ">=1.1.1",<br>  "crc32c": "==2.3.post0",<br>  "elasticsearch": "==7.13.1",<br>  "google-cloud-bigquery": "==3.4.0",<br>  "graphframes": "==0.6",<br>  "jsonlines": "",<br>  "networkx": "",<br>  "openpyxl": "==3.0.10",<br>  "paramiko": "",<br>  "pycryptodome": "==3.9.8",<br>  "pydash": "",<br>  "pyfarmhash": "",<br>  "pypdf2": "==3.0.1",<br>  "pyspark": "==3.2.2",<br>  "pyswip": "==0.2.10",<br>  "scikit-learn": "==1.3.0",<br>  "scraperapi-sdk": "==0.2.2",<br>  "scrapy": "==2.11.1",<br>  "scrapy-zyte-api": "==0.8.1",<br>  "slackclient": "==1.3.1",<br>  "sshtunnel": "",<br>  "telethon": "==1.26.1",<br>  "twisted": "==22.4.0",<br>  "unionfind": "",<br>  "webhoseio": "==0.5",<br>  "xlrd": ""<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region this environment should be deployed into. | `string` | `"us-central1"` | no |
| <a name="input_resilience_mode"></a> [resilience\_mode](#input\_resilience\_mode) | Set the resilience mode of this environment. | `string` | `"STANDARD_RESILIENCE"` | no |
| <a name="input_scheduler_count"></a> [scheduler\_count](#input\_scheduler\_count) | Number of schedulers to deploy. | `number` | `4` | no |
| <a name="input_scheduler_cpu"></a> [scheduler\_cpu](#input\_scheduler\_cpu) | Number of scheduler CPUs. | `number` | `28` | no |
| <a name="input_scheduler_memory_gb"></a> [scheduler\_memory\_gb](#input\_scheduler\_memory\_gb) | How much memory the scheduler should have in GB. | `number` | `28` | no |
| <a name="input_scheduler_storage_gb"></a> [scheduler\_storage\_gb](#input\_scheduler\_storage\_gb) | How much disk the scheduler should have in GB. | `number` | `10` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The service account to operate on behalf of the environment. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | Self-link of the VPC subnetwork where the GKE cluster will be created. Leave it null for Auto-mode VPCs | `string` | `null` | no |
| <a name="input_triggerer_count"></a> [triggerer\_count](#input\_triggerer\_count) | The number of triggerers for this environments. | `number` | `2` | no |
| <a name="input_triggerer_cpu"></a> [triggerer\_cpu](#input\_triggerer\_cpu) | The number of CPUs per triggerer in this environment. | `number` | `1` | no |
| <a name="input_triggerer_memory_gb"></a> [triggerer\_memory\_gb](#input\_triggerer\_memory\_gb) | The memory in GB per triggerer in this environment. | `number` | `1` | no |
| <a name="input_v_airflow"></a> [v\_airflow](#input\_v\_airflow) | Version of Airflow to be using. | `string` | `"2.7.3"` | no |
| <a name="input_v_composer"></a> [v\_composer](#input\_v\_composer) | Version of Cloud Composer to be using. | `string` | `"2.6.5"` | no |
| <a name="input_web_server_cpu"></a> [web\_server\_cpu](#input\_web\_server\_cpu) | Number of CPUs for the web server. | `number` | `16` | no |
| <a name="input_web_server_memory_gb"></a> [web\_server\_memory\_gb](#input\_web\_server\_memory\_gb) | Amount of memory for the web server in GB. | `number` | `32` | no |
| <a name="input_web_server_storage_gb"></a> [web\_server\_storage\_gb](#input\_web\_server\_storage\_gb) | Amount of disk for the web server in GB. | `number` | `10` | no |
| <a name="input_worker_cpu"></a> [worker\_cpu](#input\_worker\_cpu) | Number of worker CPUs. | `number` | `16` | no |
| <a name="input_worker_max_count"></a> [worker\_max\_count](#input\_worker\_max\_count) | Max number of workers to scale up to. | `number` | `12` | no |
| <a name="input_worker_memory_gb"></a> [worker\_memory\_gb](#input\_worker\_memory\_gb) | Amount of worker memory in GB. | `number` | `64` | no |
| <a name="input_worker_min_count"></a> [worker\_min\_count](#input\_worker\_min\_count) | Minimum number of workers to scale down to. | `number` | `4` | no |
| <a name="input_worker_storage_gb"></a> [worker\_storage\_gb](#input\_worker\_storage\_gb) | Amount of worker disk in GB. | `number` | `10` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
