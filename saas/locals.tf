locals {
  airflow_config = merge(
    var.airflow_config, var.config_overrides
  )
  package_config = merge(
    var.packages, var.package_overrides
  )
}
