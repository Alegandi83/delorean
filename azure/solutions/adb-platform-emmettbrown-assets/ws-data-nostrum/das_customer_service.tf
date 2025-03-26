resource "databricks_catalog" "das_customer_service" {
  metastore_id    = var.metastore_id
  name            = "das_customer_service"
  comment         = "das_customer_service"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source2-schema" {
  depends_on    = [databricks_catalog.das_customer_service]
  catalog_name  = databricks_catalog.das_customer_service.name
  name          = "das_source2"
  force_destroy = true
}