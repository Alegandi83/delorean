resource "databricks_catalog" "das_human_resources" {
  metastore_id    = var.metastore_id
  name            = "das_human_resources"
  comment         = "das_human_resources"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "hrm_human_resource_management_systems" {
  depends_on    = [databricks_catalog.das_human_resources]
  catalog_name  = databricks_catalog.das_human_resources.name
  name          = "hrm_human_resource_management_systems"
  force_destroy = true
}

resource "databricks_schema" "pay_payroll_software" {
  depends_on    = [databricks_catalog.das_human_resources]
  catalog_name  = databricks_catalog.das_human_resources.name
  name          = "pay_payroll_software"
  force_destroy = true
}

resource "databricks_schema" "tms_talent_management_systems" {
  depends_on    = [databricks_catalog.das_human_resources]
  catalog_name  = databricks_catalog.das_human_resources.name
  name          = "tms_talent_management_systems"
  force_destroy = true
}

resource "databricks_schema" "lms_learning_management_systems" {
  depends_on    = [databricks_catalog.das_human_resources]
  catalog_name  = databricks_catalog.das_human_resources.name
  name          = "lms_learning_management_systems"
  force_destroy = true
}