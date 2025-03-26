resource "databricks_catalog" "das_marketing_and_digital_advertising" {
  metastore_id    = var.metastore_id
  name            = "das_marketing_and_digital_advertising"
  comment         = "das_marketing_and_digital_advertising"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source8-schema" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "das_source8"
  force_destroy = true
}