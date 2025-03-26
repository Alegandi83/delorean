resource "databricks_catalog" "das_operations" {
  metastore_id    = var.metastore_id
  name            = "das_operations"
  comment         = "das_operations"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source9-schema" {
  depends_on    = [databricks_catalog.das_operations]
  catalog_name  = databricks_catalog.das_operations.name
  name          = "das_source9"
  force_destroy = true
}