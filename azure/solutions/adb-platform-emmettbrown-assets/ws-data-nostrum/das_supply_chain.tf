resource "databricks_catalog" "das_supply_chain" {
  metastore_id    = var.metastore_id
  name            = "das_supply_chain"
  comment         = "das_supply_chain"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "scm_supply_chain_management_1" {
  depends_on    = [databricks_catalog.das_supply_chain]
  catalog_name  = databricks_catalog.das_supply_chain.name
  name          = "scm_supply_chain_management"
  force_destroy = true
}

resource "databricks_schema" "erp_enterprise_resource_planning_1" {
  depends_on    = [databricks_catalog.das_supply_chain]
  catalog_name  = databricks_catalog.das_supply_chain.name
  name          = "erp_enterprise_resource_planning"
  force_destroy = true
}

resource "databricks_schema" "tms_transportation_management_systems_1" {
  depends_on    = [databricks_catalog.das_supply_chain]
  catalog_name  = databricks_catalog.das_supply_chain.name
  name          = "tms_transportation_management_systems"
  force_destroy = true
}

resource "databricks_schema" "wms_warehouse_management_systems_1" {
  depends_on    = [databricks_catalog.das_supply_chain]
  catalog_name  = databricks_catalog.das_supply_chain.name
  name          = "wms_warehouse_management_systems"
  force_destroy = true
}

resource "databricks_schema" "ems_environmental_management_systems" {
  depends_on    = [databricks_catalog.das_supply_chain]
  catalog_name  = databricks_catalog.das_supply_chain.name
  name          = "ems_environmental_management_systems"
  force_destroy = true
}