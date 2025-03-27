resource "databricks_catalog" "das_operations" {
  metastore_id    = var.metastore_id
  name            = "das_operations"
  comment         = "das_operations"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "erp_enterprise_resource_planning_4" {
  depends_on    = [databricks_catalog.das_operations]
  catalog_name  = databricks_catalog.das_operations.name
  name          = "erp_enterprise_resource_planning"
  force_destroy = true
}

resource "databricks_schema" "mes_manufacturing_execution_systems_1" {
  depends_on    = [databricks_catalog.das_operations]
  catalog_name  = databricks_catalog.das_operations.name
  name          = "mes_manufacturing_execution_systems"
  force_destroy = true
}

resource "databricks_schema" "scm_supply_chain_management_2" {
  depends_on    = [databricks_catalog.das_operations]
  catalog_name  = databricks_catalog.das_operations.name
  name          = "scm_supply_chain_management"
  force_destroy = true
}

resource "databricks_schema" "cmms_computerized_maintenance_management_systems" {
  depends_on    = [databricks_catalog.das_operations]
  catalog_name  = databricks_catalog.das_operations.name
  name          = "cmms_computerized_maintenance_management_systems"
  force_destroy = true
}

resource "databricks_schema" "itsm_it_service_management" {
  depends_on    = [databricks_catalog.das_operations]
  catalog_name  = databricks_catalog.das_operations.name
  name          = "itsm_it_service_management"
  force_destroy = true
}