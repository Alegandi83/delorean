resource "databricks_catalog" "das_quality" {
  metastore_id    = var.metastore_id
  name            = "das_quality"
  comment         = "das_quality"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "qms_quality_management_systems" {
  depends_on    = [databricks_catalog.das_quality]
  catalog_name  = databricks_catalog.das_quality.name
  name          = "qms_quality_management_systems"
  force_destroy = true
}

resource "databricks_schema" "ics_iso_compliance_software" {
  depends_on    = [databricks_catalog.das_quality]
  catalog_name  = databricks_catalog.das_quality.name
  name          = "ics_iso_compliance_software"
  force_destroy = true
}

resource "databricks_schema" "tit_testing_and_inspection_tools" {
  depends_on    = [databricks_catalog.das_quality]
  catalog_name  = databricks_catalog.das_quality.name
  name          = "tit_testing_and_inspection_tools"
  force_destroy = true
}

resource "databricks_schema" "dts_defect_tracking_systems" {
  depends_on    = [databricks_catalog.das_quality]
  catalog_name  = databricks_catalog.das_quality.name
  name          = "dts_defect_tracking_systems"
  force_destroy = true
}