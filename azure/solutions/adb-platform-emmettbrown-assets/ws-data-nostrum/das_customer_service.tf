resource "databricks_catalog" "das_customer_service" {
  metastore_id    = var.metastore_id
  name            = "das_customer_service"
  comment         = "das_customer_service"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "crm_customer_relationship_management_2" {
  depends_on    = [databricks_catalog.das_customer_service]
  catalog_name  = databricks_catalog.das_customer_service.name
  name          = "crm_customer_relationship_management"
  force_destroy = true
}

resource "databricks_schema" "hds_help_desk_software" {
  depends_on    = [databricks_catalog.das_customer_service]
  catalog_name  = databricks_catalog.das_customer_service.name
  name          = "hds_help_desk_software"
  force_destroy = true
}

resource "databricks_schema" "fms_feedback_management_systems" {
  depends_on    = [databricks_catalog.das_customer_service]
  catalog_name  = databricks_catalog.das_customer_service.name
  name          = "fms_feedback_management_systems"
  force_destroy = true
}