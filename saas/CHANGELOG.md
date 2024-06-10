# Changelog

## gcp/composer/saas-1.0.0 - 2023-01-05
### Added

- Introduce the module.

## gcp/composer/saas-2.0.0 - 2023-01-17
###  Changed

- Import the v2 version of the module from iguana repository.

## gcp/composer/saas-2.1.0 - 2023-01-25
### Added

- Add variable to control environment variable injection.

## gcp/composer/saas-2.2.0 - 2023-01-26
### Added

- Add two new scraping packages to default packages.
 
## gcp/composer/saas-2.3.0 - 2023-01-26
### Added

- Add creation of an ML bucket for each SaaS environment.

## gcp/composer/saas-2.4.0 - 2023-02-07
### Added

- Add openpyxl==3.0.10

## gcp/composer/saas-2.5.0 - 2023-03-21
### Changed

- Change the ML bucket feature to be optional & controlled via a new variable.

## gcp/composer/saas-2.6.0 - 2023-05-25
### Added

- Add 3 Python packages as tested in staging.

## gcp/composer/saas-2.7.0 - 2023-06-15
### Added

- Added a new variable, `network`, to support manual-mode VPCs (used only in testing at the moment)
- Added a new variable, `subnetwork`, to support manual-mode VPCs (used only in testing at the moment)
- Added an installation of the OpenTelemetry collector. Since this requires the addition of providers within the module itself, this module cannot be used with `for_each` or `count` any longer.

### Removed
- Removed the entire local-exec section, we handle those steps in a different way now
- Removed a number of variable declarations, data sources and resources which are no longer in use

## gcp/composer/saas-2.8.0 - 2023-08-12
### Added

- Add scikit-learn==1.3.0

## gcp/composer/saas-2.9.0 - 2023-09-26
### Changed

- Upgraded apache-airflow-providers-amazon to 7.2.1

## gcp/composer/saas-2.11.0 - 2023-11-13
### Changed

- Double triggerer count in each environment by default.
- Bump Python packages for compatibility with new Composer image
- Update default Airflow config with stalled task timeout.
 
## gcp/composer/saas-2.11.1 - 2023-11-14
### Fixed

- Control resilience mode with a flag instead of a statis value.

## gcp/composer/saas-2.12.0 - 2023-11-29
### Updated

- Bumped pyspark to 3.2.2
 
## gcp/composer/saas-2.13.0 - 2023-12-12
### Added

- Added new package PyPDF2

## gcp/composer/saas-2.14.0 - 2023-04-01
### Added

- Upgraded airflow version to 2.7.3
- Upgraded composer version to 2.6.5
- Upgraded scrapy to 2.11.1
- Upgraded google-cloud-bigquery to 3.4.0
- Replaced coinaddrvalidator with coinaddrng 1.1.1
- Update config load_default_connections

## gcp/composer/saas-2.15.0 - 2023-04-02
### Added

- Update config database-load_default_connections
- Update config core-max_active_tasks_per_dag
- Update config core-dagbag_import_timeout 
- Update config core-dag_file_processor_timeout
- Update config scheduler-min_file_process_interval
- Update config scheduler-min_file_process_interval
- Update config scheduler-max_dagruns_per_loop_to_schedule
- Update config scheduler-scheduler_health_check_threshold
- Update config celery-worker_concurrency

## gcp/composer/saas-2.16.0 - 2023-04-10
### Added
- Update config scheduler-task_queued_timeout
- Update config scheduler-min_file_process_interval
- Update config scheduler-dag_dir_list_interval
- Update config scheduler-max_dagruns_per_loop_to_schedule