resource "databricks_catalog" "das_store_operations" {
  metastore_id    = var.metastore_id
  name            = "das_store_operations"
  comment         = "das_store_operations"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "pos_point_of_sale_1" {
  depends_on    = [databricks_catalog.das_store_operations]
  catalog_name  = databricks_catalog.das_store_operations.name
  name          = "pos_point_of_sale"
  force_destroy = true
}

resource "databricks_schema" "ims_inventory_management_systems_2" {
  depends_on    = [databricks_catalog.das_store_operations]
  catalog_name  = databricks_catalog.das_store_operations.name
  name          = "ims_inventory_management_systems"
  force_destroy = true
}

resource "databricks_schema" "sms_store_management_software" {
  depends_on    = [databricks_catalog.das_store_operations]
  catalog_name  = databricks_catalog.das_store_operations.name
  name          = "sms_store_management_software"
  force_destroy = true
}

resource "databricks_schema" "ecm_ecommerce_platforms_1" {
  depends_on    = [databricks_catalog.das_store_operations]
  catalog_name  = databricks_catalog.das_store_operations.name
  name          = "ecm_ecommerce_platforms"
  force_destroy = true
}