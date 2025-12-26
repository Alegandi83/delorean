resource "databricks_catalog" "dap_geoanalytics" {
  metastore_id    = var.metastore_id
  name            = "dap_geoanalytics"
  comment         = "dap geographical analysis"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "dap_locations" {
  depends_on    = [databricks_catalog.dap_geoanalytics]
  catalog_name  = databricks_catalog.dap_geoanalytics.name
  name          = "dap_locations"
  force_destroy = true
}