resource "databricks_catalog" "dap_brand_and_product_mngmt" {
  metastore_id    = var.metastore_id
  name            = "dap_brand_and_product_mngmt"
  comment         = "dap brand and product mngmt"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "product_copy_generation" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "product_copy_generation"
  force_destroy = true
}

resource "databricks_schema" "intelligent_product_search" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "intelligent_product_search"
  force_destroy = true
}

resource "databricks_schema" "product_onboarding" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "product_onboarding"
  force_destroy = true
}

resource "databricks_schema" "fuzzy_item_matching" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "fuzzy_item_matching"
  force_destroy = true
}

resource "databricks_schema" "brand_aligned_images" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "brand_aligned_images"
  force_destroy = true
}