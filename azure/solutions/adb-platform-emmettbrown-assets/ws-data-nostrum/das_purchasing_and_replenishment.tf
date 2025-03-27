resource "databricks_catalog" "das_purchasing_and_replenishment" {
  metastore_id    = var.metastore_id
  name            = "das_purchasing_and_replenishment"
  comment         = "das_purchasing_and_replenishment"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "prc_procurement_software" {
  depends_on    = [databricks_catalog.das_purchasing_and_replenishment]
  catalog_name  = databricks_catalog.das_purchasing_and_replenishment.name
  name          = "prc_procurement_software"
  force_destroy = true
}

resource "databricks_schema" "srm_supplier_relationship_management" {
  depends_on    = [databricks_catalog.das_purchasing_and_replenishment]
  catalog_name  = databricks_catalog.das_purchasing_and_replenishment.name
  name          = "srm_supplier_relationship_management"
  force_destroy = true
}

resource "databricks_schema" "ims_inventory_management_systems" {
  depends_on    = [databricks_catalog.das_purchasing_and_replenishment]
  catalog_name  = databricks_catalog.das_purchasing_and_replenishment.name
  name          = "ims_inventory_management_systems"
  force_destroy = true
}

resource "databricks_schema" "ars_automated_replenishment_systems" {
  depends_on    = [databricks_catalog.das_purchasing_and_replenishment]
  catalog_name  = databricks_catalog.das_purchasing_and_replenishment.name
  name          = "ars_automated_replenishment_systems"
  force_destroy = true
}