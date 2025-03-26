resource "databricks_catalog" "das_delivery_and_returns" {
  metastore_id    = var.metastore_id
  name            = "das_delivery_and_returns"
  comment         = "das_delivery_and_returns"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source3-schema" {
  depends_on    = [databricks_catalog.das_delivery_and_returns]
  catalog_name  = databricks_catalog.das_delivery_and_returns.name
  name          = "das_source3"
  force_destroy = true
}
