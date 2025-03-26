resource "databricks_catalog" "das_purchasing_and_replenishment" {
  metastore_id    = var.metastore_id
  name            = "das_purchasing_and_replenishment"
  comment         = "das_purchasing_and_replenishment"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source13-schema" {
  depends_on    = [databricks_catalog.das_purchasing_and_replenishment]
  catalog_name  = databricks_catalog.das_purchasing_and_replenishment.name
  name          = "das_source13"
  force_destroy = true
}