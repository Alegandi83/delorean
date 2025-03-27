resource "databricks_catalog" "das_planning" {
  metastore_id    = var.metastore_id
  name            = "das_planning"
  comment         = "das_planning"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "erp_enterprise_resource_planning_3" {
  depends_on    = [databricks_catalog.das_planning]
  catalog_name  = databricks_catalog.das_planning.name
  name          = "erp_enterprise_resource_planning"
  force_destroy = true
}

resource "databricks_schema" "mrp_material_requirements_planning_2" {
  depends_on    = [databricks_catalog.das_planning]
  catalog_name  = databricks_catalog.das_planning.name
  name          = "mrp_material_requirements_planning"
  force_destroy = true
}

resource "databricks_schema" "drp_distribution_resource_planning" {
  depends_on    = [databricks_catalog.das_planning]
  catalog_name  = databricks_catalog.das_planning.name
  name          = "drp_distribution_resource_planning"
  force_destroy = true
}