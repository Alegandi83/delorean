resource "databricks_catalog" "das_information_technologies" {
  metastore_id    = var.metastore_id
  name            = "das_information_technologies"
  comment         = "das information technologies"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "apitube" {
  depends_on    = [databricks_catalog.das_information_technologies]
  catalog_name  = databricks_catalog.das_information_technologies.name
  name          = "apitube"
  force_destroy = true
}