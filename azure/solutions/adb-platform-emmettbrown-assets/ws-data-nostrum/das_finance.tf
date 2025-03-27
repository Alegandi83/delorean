resource "databricks_catalog" "das_finance" {
  metastore_id    = var.metastore_id
  name            = "das_finance"
  comment         = "das_finance"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "erp_enterprise_resource_planning" {
  depends_on    = [databricks_catalog.das_finance]
  catalog_name  = databricks_catalog.das_finance.name
  name          = "erp_enterprise_resource_planning"
  force_destroy = true
}

resource "databricks_schema" "acc_accounting_software" {
  depends_on    = [databricks_catalog.das_finance]
  catalog_name  = databricks_catalog.das_finance.name
  name          = "acc_accounting_software"
  force_destroy = true
}

resource "databricks_schema" "fpa_financial_planning_and_analysis" {
  depends_on    = [databricks_catalog.das_finance]
  catalog_name  = databricks_catalog.das_finance.name
  name          = "fpa_financial_planning_and_analysis"
  force_destroy = true
}

resource "databricks_schema" "rms_risk_management_systems" {
  depends_on    = [databricks_catalog.das_finance]
  catalog_name  = databricks_catalog.das_finance.name
  name          = "rms_risk_management_systems"
  force_destroy = true
}