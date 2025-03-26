resource "databricks_catalog" "dap_sales_and_finance" {
  metastore_id    = var.metastore_id
  name            = "dap_sales_and_finance"
  comment         = "dap_sales_and_finance"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "finance_portoflio_assistant" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "finance_portoflio_assistant"
  force_destroy = true
}

resource "databricks_schema" "sales_forecasting_and_attribution" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "sales_forecasting_and_attribution"
  force_destroy = true
}

resource "databricks_schema" "sales_pipeline_review" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "sales_pipeline_review"
  force_destroy = true
}

resource "databricks_schema" "ssales_inventory_analysis" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "sales_inventory_analysis"
  force_destroy = true
}