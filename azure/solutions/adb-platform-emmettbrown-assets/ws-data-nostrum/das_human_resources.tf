resource "databricks_catalog" "das_human_resources" {
  metastore_id    = var.metastore_id
  name            = "das_human_resources"
  comment         = "das_human_resources"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source5-schema" {
  depends_on    = [databricks_catalog.das_human_resources]
  catalog_name  = databricks_catalog.das_human_resources.name
  name          = "das_source5"
  force_destroy = true
}