resource "databricks_catalog" "das_quality" {
  metastore_id    = var.metastore_id
  name            = "das_quality"
  comment         = "das_quality"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source14-schema" {
  depends_on    = [databricks_catalog.das_quality]
  catalog_name  = databricks_catalog.das_quality.name
  name          = "das_source14"
  force_destroy = true
}