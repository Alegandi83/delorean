resource "databricks_catalog" "das_sales_and_merchandising" {
  metastore_id    = var.metastore_id
  name            = "das_sales_and_merchandising"
  comment         = "das_sales_and_merchandising"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "crm_customer_relationship_management_1" {
  depends_on    = [databricks_catalog.das_sales_and_merchandising]
  catalog_name  = databricks_catalog.das_sales_and_merchandising.name
  name          = "crm_customer_relationship_management"
  force_destroy = true
}

resource "databricks_schema" "pos_point_of_sale" {
  depends_on    = [databricks_catalog.das_sales_and_merchandising]
  catalog_name  = databricks_catalog.das_sales_and_merchandising.name
  name          = "pos_point_of_sale"
  force_destroy = true
}

resource "databricks_schema" "ecm_ecommerce_platforms" {
  depends_on    = [databricks_catalog.das_sales_and_merchandising]
  catalog_name  = databricks_catalog.das_sales_and_merchandising.name
  name          = "ecm_ecommerce_platforms"
  force_destroy = true
}

resource "databricks_schema" "ims_inventory_management_systems_1" {
  depends_on    = [databricks_catalog.das_sales_and_merchandising]
  catalog_name  = databricks_catalog.das_sales_and_merchandising.name
  name          = "ims_inventory_management_systems"
  force_destroy = true
}