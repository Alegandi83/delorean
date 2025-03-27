resource "databricks_catalog" "das_revenue_management" {
  metastore_id    = var.metastore_id
  name            = "das_revenue_management"
  comment         = "das_revenue_management"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "erp_enterprise_resource_planning_2" {
  depends_on    = [databricks_catalog.das_revenue_management]
  catalog_name  = databricks_catalog.das_revenue_management.name
  name          = "erp_enterprise_resource_planning"
  force_destroy = true
}

resource "databricks_schema" "rms_revenue_management_systems" {
  depends_on    = [databricks_catalog.das_revenue_management]
  catalog_name  = databricks_catalog.das_revenue_management.name
  name          = "rms_revenue_management_systems"
  force_destroy = true
}

resource "databricks_schema" "pot_pricing_optimization_tools" {
  depends_on    = [databricks_catalog.das_revenue_management]
  catalog_name  = databricks_catalog.das_revenue_management.name
  name          = "pot_pricing_optimization_tools"
  force_destroy = true
}