resource "databricks_catalog" "das_store_operations" {
  metastore_id    = var.metastore_id
  name            = "das_store_operations"
  comment         = "das_store_operations"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source17-schema" {
  depends_on    = [databricks_catalog.das_store_operations]
  catalog_name  = databricks_catalog.das_store_operations.name
  name          = "das_source17"
  force_destroy = true
}