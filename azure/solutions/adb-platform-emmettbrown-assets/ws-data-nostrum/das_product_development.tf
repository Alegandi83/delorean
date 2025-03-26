resource "databricks_catalog" "das_product_development" {
  metastore_id    = var.metastore_id
  name            = "das_product_development"
  comment         = "das product development"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source12-schema" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "das_source12"
  force_destroy = true
}