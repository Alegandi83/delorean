resource "databricks_catalog" "dap_brand_and_product_mngmt" {
  metastore_id    = var.metastore_id
  name            = "dap_brand_and_product_mngmt"
  comment         = "dap brand and product mngmt"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source1-schema" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "das_source1"
  force_destroy = true
}