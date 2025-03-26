resource "databricks_catalog" "das_planning" {
  metastore_id    = var.metastore_id
  name            = "das_planning"
  comment         = "das_planning"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source11-schema" {
  depends_on    = [databricks_catalog.das_planning]
  catalog_name  = databricks_catalog.das_planning.name
  name          = "das_source11"
  force_destroy = true
}