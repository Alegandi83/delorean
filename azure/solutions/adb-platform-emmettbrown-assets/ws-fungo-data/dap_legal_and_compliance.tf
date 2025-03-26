resource "databricks_catalog" "dap_legal_and_compliance" {
  metastore_id    = var.metastore_id
  name            = "dap_legal_and_compliance"
  comment         = "dap_legal_and_compliance"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "legal_and_compliance" {
  depends_on    = [databricks_catalog.dap_legal_and_compliance]
  catalog_name  = databricks_catalog.dap_legal_and_compliance.name
  name          = "legal_and_compliance"
  force_destroy = true
}