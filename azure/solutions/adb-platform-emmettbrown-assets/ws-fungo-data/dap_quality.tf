resource "databricks_catalog" "dap_quality" {
  metastore_id    = var.metastore_id
  name            = "dap_quality"
  comment         = "ddap_quality"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "product_quality_inspection" {
  depends_on    = [databricks_catalog.dap_quality]
  catalog_name  = databricks_catalog.dap_quality.name
  name          = "product_quality_inspection"
  force_destroy = true
}