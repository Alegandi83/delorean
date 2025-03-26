resource "databricks_catalog" "dap_cablemaster" {
  metastore_id    = var.metastore_id
  name            = "dap_cablemaster"
  comment         = "das information technologies"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "dap_energy" {
  depends_on    = [databricks_catalog.dap_cablemaster]
  catalog_name  = databricks_catalog.dap_cablemaster.name
  name          = "dap_energy"
  force_destroy = true
}

resource "databricks_schema" "dap_telecom" {
  depends_on    = [databricks_catalog.dap_cablemaster]
  catalog_name  = databricks_catalog.dap_cablemaster.name
  name          = "dap_telecom"
  force_destroy = true
}

resource "databricks_schema" "dap_manufacturing" {
  depends_on    = [databricks_catalog.dap_cablemaster]
  catalog_name  = databricks_catalog.dap_cablemaster.name
  name          = "dap_manufacturing"
  force_destroy = true
}

resource "databricks_schema" "dap_sales_marketing" {
  depends_on    = [databricks_catalog.dap_cablemaster]
  catalog_name  = databricks_catalog.dap_cablemaster.name
  name          = "dap_sales_marketing"
  force_destroy = true
}

resource "databricks_schema" "dap_finance" {
  depends_on    = [databricks_catalog.dap_cablemaster]
  catalog_name  = databricks_catalog.dap_cablemaster.name
  name          = "dap_finance"
  force_destroy = true
}