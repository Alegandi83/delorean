resource "databricks_catalog" "das_sales_and_merchandising" {
  metastore_id    = var.metastore_id
  name            = "das_sales_and_merchandising"
  comment         = "das_sales_and_merchandising"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source16schema" {
  depends_on    = [databricks_catalog.das_sales_and_merchandising]
  catalog_name  = databricks_catalog.das_sales_and_merchandising.name
  name          = "das_source16"
  force_destroy = true
}