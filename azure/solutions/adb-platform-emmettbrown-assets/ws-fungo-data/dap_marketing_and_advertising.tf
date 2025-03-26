resource "databricks_catalog" "dap_marketing_and_advertising" {
  metastore_id    = var.metastore_id
  name            = "dap_marketing_and_advertising"
  comment         = "dap_marketing_and_advertising"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "customer_insights_segmentation" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "customer_insights_segmentation"
  force_destroy = true
}

resource "databricks_schema" "customer_churn_analytics" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "customer_churn_analytics"
  force_destroy = true
}

resource "databricks_schema" "omnichannel_customer_360" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "omnichannel_customer_360"
  force_destroy = true
}

resource "databricks_schema" "customer_lifetime_value" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "customer_lifetime_value"
  force_destroy = true
}

resource "databricks_schema" "rfm_segmentation" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "rfm_segmentation"
  force_destroy = true
}

resource "databricks_schema" "customer_entity_resolution" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "customer_entity_resolution"
  force_destroy = true
}

resource "databricks_schema" "price_and_promotions" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "price_and_promotions"
  force_destroy = true
}

resource "databricks_schema" "price_analytics" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "price_analytics"
  force_destroy = true
}

resource "databricks_schema" "next_best_action" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "next_best_action"
  force_destroy = true
}

resource "databricks_schema" "propensity_scoring" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "propensity_scoring"
  force_destroy = true
}

resource "databricks_schema" "multi_touch_attribution" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "multi_touch_attribution"
  force_destroy = true
}

resource "databricks_schema" "marketing_campaign_optimization" {
  depends_on    = [databricks_catalog.dap_marketing_and_advertising]
  catalog_name  = databricks_catalog.dap_marketing_and_advertising.name
  name          = "marketing_campaign_optimization"
  force_destroy = true
}