resource "databricks_catalog" "das_consumer_engagement_and_loyalty" {
  metastore_id    = var.metastore_id
  name            = "das_consumer_engagement_and_loyalty"
  comment         = "das_consumer_engagement_and_loyalty"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "crm_customer_relationship_management" {
  depends_on    = [databricks_catalog.das_consumer_engagement_and_loyalty]
  catalog_name  = databricks_catalog.das_consumer_engagement_and_loyalty.name
  name          = "crm_customer_relationship_management"
  force_destroy = true
}

resource "databricks_schema" "mrk_marketing_automation_tools" {
  depends_on    = [databricks_catalog.das_consumer_engagement_and_loyalty]
  catalog_name  = databricks_catalog.das_consumer_engagement_and_loyalty.name
  name          = "mrk_marketing_automation_tools"
  force_destroy = true
}

resource "databricks_schema" "lps_loyalty_program_software" {
  depends_on    = [databricks_catalog.das_consumer_engagement_and_loyalty]
  catalog_name  = databricks_catalog.das_consumer_engagement_and_loyalty.name
  name          = "lps_loyalty_program_software"
  force_destroy = true
}

resource "databricks_schema" "smm_social_media_management_tools" {
  depends_on    = [databricks_catalog.das_consumer_engagement_and_loyalty]
  catalog_name  = databricks_catalog.das_consumer_engagement_and_loyalty.name
  name          = "smm_social_media_management_tools"
  force_destroy = true
}