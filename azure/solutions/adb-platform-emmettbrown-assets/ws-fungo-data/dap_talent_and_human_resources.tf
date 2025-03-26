resource "databricks_catalog" "dap_talent_and_human_resources" {
  metastore_id    = var.metastore_id
  name            = "dap_talent_and_human_resources"
  comment         = "dap_talent_and_human_resources"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "talent_acquisition" {
  depends_on    = [databricks_catalog.dap_talent_and_human_resources]
  catalog_name  = databricks_catalog.dap_talent_and_human_resources.name
  name          = "talent_acquisition"
  force_destroy = true
}

resource "databricks_schema" "employee_engagement" {
  depends_on    = [databricks_catalog.dap_talent_and_human_resources]
  catalog_name  = databricks_catalog.dap_talent_and_human_resources.name
  name          = "employee_engagement"
  force_destroy = true
}