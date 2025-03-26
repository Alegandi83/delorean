resource "databricks_catalog" "das_revenue_management" {
  metastore_id    = var.metastore_id
  name            = "das_revenue_management"
  comment         = "das_revenue_management"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source15-schema" {
  depends_on    = [databricks_catalog.das_revenue_management]
  catalog_name  = databricks_catalog.das_revenue_management.name
  name          = "das_source15"
  force_destroy = true
}