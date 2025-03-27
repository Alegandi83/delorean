resource "databricks_catalog" "das_manufacturing_and_procurement" {
  metastore_id    = var.metastore_id
  name            = "das_manufacturing_and_procurement"
  comment         = "das_manufacturing_and_procurement"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "erp_enterprise_resource_planning_5" {
  depends_on    = [databricks_catalog.das_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.das_manufacturing_and_procurement.name
  name          = "erp_enterprise_resource_planning"
  force_destroy = true
}

resource "databricks_schema" "mes_manufacturing_execution_systems" {
  depends_on    = [databricks_catalog.das_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.das_manufacturing_and_procurement.name
  name          = "mes_manufacturing_execution_systems"
  force_destroy = true
}

resource "databricks_schema" "mrp_material_requirements_planning" {
  depends_on    = [databricks_catalog.das_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.das_manufacturing_and_procurement.name
  name          = "mrp_material_requirements_planning"
  force_destroy = true
}

resource "databricks_schema" "scm_supply_chain_management" {
  depends_on    = [databricks_catalog.das_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.das_manufacturing_and_procurement.name
  name          = "scm_supply_chain_management"
  force_destroy = true
}