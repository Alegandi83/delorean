resource "databricks_catalog" "das_supply_chain" {
  metastore_id    = var.metastore_id
  name            = "das_supply_chain"
  comment         = "das_supply_chain"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source18-schema" {
  depends_on    = [databricks_catalog.das_supply_chain]
  catalog_name  = databricks_catalog.das_supply_chain.name
  name          = "das_source18"
  force_destroy = true
}