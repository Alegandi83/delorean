resource "databricks_catalog" "das_consumer_engagement_and_Loyalty" {
  metastore_id    = var.metastore_id
  name            = "das_consumer_engagement_and_Loyalty"
  comment         = "das_consumer_engagement_and_Loyalty"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source1-schema" {
  depends_on    = [databricks_catalog.das_consumer_engagement_and_Loyalty]
  catalog_name  = databricks_catalog.das_consumer_engagement_and_Loyalty.name
  name          = "das_source1"
  force_destroy = true
}