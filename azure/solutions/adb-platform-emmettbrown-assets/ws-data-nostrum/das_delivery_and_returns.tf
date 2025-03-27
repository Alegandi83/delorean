resource "databricks_catalog" "das_delivery_and_returns" {
  metastore_id    = var.metastore_id
  name            = "das_delivery_and_returns"
  comment         = "das_delivery_and_returns"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "tms_transportation_management_systems" {
  depends_on    = [databricks_catalog.das_delivery_and_returns]
  catalog_name  = databricks_catalog.das_delivery_and_returns.name
  name          = "tms_transportation_management_systems"
  force_destroy = true
}

resource "databricks_schema" "wms_warehouse_management_systems" {
  depends_on    = [databricks_catalog.das_delivery_and_returns]
  catalog_name  = databricks_catalog.das_delivery_and_returns.name
  name          = "wms_warehouse_management_systems"
  force_destroy = true
}

resource "databricks_schema" "rls_reverse_logistics_software" {
  depends_on    = [databricks_catalog.das_delivery_and_returns]
  catalog_name  = databricks_catalog.das_delivery_and_returns.name
  name          = "rls_reverse_logistics_software"
  force_destroy = true
}

resource "databricks_schema" "rma_return_merchandise_authorization_systems" {
  depends_on    = [databricks_catalog.das_delivery_and_returns]
  catalog_name  = databricks_catalog.das_delivery_and_returns.name
  name          = "rma_return_merchandise_authorization_systems"
  force_destroy = true
}
