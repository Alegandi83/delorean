resource "databricks_catalog" "das_finance" {
  metastore_id    = var.metastore_id
  name            = "das_finance"
  comment         = "das_finance"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source41-schema" {
  depends_on    = [databricks_catalog.das_finance]
  catalog_name  = databricks_catalog.das_finance.name
  name          = "das_source41"
  force_destroy = true
}