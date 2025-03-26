resource "databricks_catalog" "das_manufacturing_and_procurement" {
  metastore_id    = var.metastore_id
  name            = "das_manufacturing_and_procurement"
  comment         = "das_manufacturing_and_procurement"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source7-schema" {
  depends_on    = [databricks_catalog.das_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.das_manufacturing_and_procurement.name
  name          = "das_source7"
  force_destroy = true
}