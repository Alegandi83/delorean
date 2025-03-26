resource "databricks_catalog" "das_logistics_and_distribution" {
  metastore_id    = var.metastore_id
  name            = "das_logistics_and_distribution"
  comment         = "das_logistics_and_distribution"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source6-schema" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "das_source6"
  force_destroy = true
}