resource "databricks_catalog" "dap_digital_and_retail" {
  metastore_id    = var.metastore_id
  name            = "dap_digital_and_retail"
  comment         = "dap_digital_and_retail"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "real_time_personalization" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "real_time_personalization"
  force_destroy = true
}

resource "databricks_schema" "product_recommendation" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "product_recommendation"
  force_destroy = true
}

resource "databricks_schema" "personalized_recommendations" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "personalized_recommendations"
  force_destroy = true
}

resource "databricks_schema" "social_engagement" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "social_engagement"
  force_destroy = true
}

resource "databricks_schema" "customer_sentiment" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "customer_sentiment"
  force_destroy = true
}

resource "databricks_schema" "product_review_summarization" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "product_review_summarization"
  force_destroy = true
}

resource "databricks_schema" "point_of_sales_analytics" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "point_of_sales_analytics"
  force_destroy = true
}

resource "databricks_schema" "market_basket_analysis" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "market_basket_analysis"
  force_destroy = true
}

resource "databricks_schema" "checkout_free_retail" {
  depends_on    = [databricks_catalog.dap_digital_and_retail]
  catalog_name  = databricks_catalog.dap_digital_and_retail.name
  name          = "checkout_free_retail"
  force_destroy = true
}