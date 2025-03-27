resource "databricks_catalog" "das_logistics_and_distribution" {
  metastore_id    = var.metastore_id
  name            = "das_logistics_and_distribution"
  comment         = "das_logistics_and_distribution"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "tms_transportation_management_systems_2" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "tms_transportation_management_systems"
  force_destroy = true
}

resource "databricks_schema" "wms_warehouse_management_systems_2" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "wms_warehouse_management_systems"
  force_destroy = true
}

resource "databricks_schema" "yms_yard_management_systems" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "yms_yard_management_systems"
  force_destroy = true
}

resource "databricks_schema" "gps_global_positioning_systems" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "gps_global_positioning_systems"
  force_destroy = true
}

resource "databricks_schema" "its_intelligent_transportation_systems" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "its_intelligent_transportation_systems"
  force_destroy = true
}

resource "databricks_schema" "gis_geographic_information_systems" {
  depends_on    = [databricks_catalog.das_logistics_and_distribution]
  catalog_name  = databricks_catalog.das_logistics_and_distribution.name
  name          = "gis_geographic_information_systems"
  force_destroy = true
}