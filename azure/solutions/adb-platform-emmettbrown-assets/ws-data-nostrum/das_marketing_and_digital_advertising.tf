resource "databricks_catalog" "das_marketing_and_digital_advertising" {
  metastore_id    = var.metastore_id
  name            = "das_marketing_and_digital_advertising"
  comment         = "das_marketing_and_digital_advertising"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "mts_martech_stack" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "mts_martech_stack"
  force_destroy = true
}

resource "databricks_schema" "dap_digital_advertising_platforms" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "dap_digital_advertising_platforms"
  force_destroy = true
}

resource "databricks_schema" "cms_content_management_systems" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "cms_content_management_systems"
  force_destroy = true
}

resource "databricks_schema" "smm_social_media_management_tools_1" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "smm_social_media_management_tools"
  force_destroy = true
}

resource "databricks_schema" "ems_email_marketing_software" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "ems_email_marketing_software"
  force_destroy = true
}

resource "databricks_schema" "dam_digital_asset_management" {
  depends_on    = [databricks_catalog.das_marketing_and_digital_advertising]
  catalog_name  = databricks_catalog.das_marketing_and_digital_advertising.name
  name          = "dam_digital_asset_management"
  force_destroy = true
}