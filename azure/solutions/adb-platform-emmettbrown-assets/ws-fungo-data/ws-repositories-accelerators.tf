# ------------------------------------------------------------------------------------------------
# Marketing and Advertising ----------------------------------------------------------------------
resource "databricks_repo" "segmentation" {
  url   = "https://github.com/databricks-industry-solutions/segmentation.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/segmentation"
}

resource "databricks_repo" "churn" {
  url   = "https://github.com/databricks-industry-solutions/churn.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/churn"
}

resource "databricks_repo" "survival" {
  url   = "https://github.com/databricks-industry-solutions/survival.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/survival"
}

resource "databricks_repo" "survival-analysis" {
  url   = "https://github.com/databricks-industry-solutions/survival-analysis.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/survival-analysis"
}

resource "databricks_repo" "rfm-segmentation" {
  url   = "https://github.com/databricks-industry-solutions/rfm-segmentation.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/rfm-segmentation"
}

resource "databricks_repo" "customer-lifetime-value" {
  url   = "https://github.com/databricks-industry-solutions/customer-lifetime-value.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/customer-lifetime-value"
}

resource "databricks_repo" "customer-er" {
  url   = "https://github.com/databricks-industry-solutions/customer-er.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/customer-er"
}

resource "databricks_repo" "propensity-workflows" {
  url   = "https://github.com/databricks-industry-solutions/propensity-workflows.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/propensity-workflows"
}

resource "databricks_repo" "clickstream-analytics" {
  url   = "https://github.com/databricks-industry-solutions/clickstream-analytics.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/clickstream-analytics"
}

resource "databricks_repo" "multi-touch-attribution" {
  url   = "https://github.com/databricks-industry-solutions/multi-touch-attribution.git"
  path  = "/solution-accelerators/sa_marketing_and_advertising/multi-touch-attribution"
}

# ------------------------------------------------------------------------------------------------
# Sales and Finance ------------------------------------------------------------------------------
resource "databricks_repo" "campaign-effectiveness" {
  url   = "https://github.com/databricks-industry-solutions/campaign-effectiveness.git"
  path  = "/solution-accelerators/sa_sales_and_finance/campaign-effectiveness"
}

# ------------------------------------------------------------------------------------------------
# Brand and Product Management -------------------------------------------------------------------
resource "databricks_repo" "product-search" {
  url   = "https://github.com/databricks-industry-solutions/product-search.git"
  path  = "/solution-accelerators/sa_brand_and_product_management/product-search"
}

resource "databricks_repo" "fuzzy-item-matching" {
  url   = "https://github.com/databricks-industry-solutions/fuzzy-item-matching.git"
  path  = "/solution-accelerators/sa_brand_and_product_management/fuzzy-item-matching"
}

# ------------------------------------------------------------------------------------------------
# Talent and Human Resources ---------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------
# Legal and Compliance ---------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------
# Manufacturing and Procurement ------------------------------------------------------------------
resource "databricks_repo" "digital-twin" {
  url   = "https://github.com/databricks-industry-solutions/digital-twin.git"
  path  = "/solution-accelerators/sa_manufacturing_and_procurement/digital-twin"
}

resource "databricks_repo" "factory-optimization" {
  url   = "https://github.com/databricks-industry-solutions/factory-optimization.git"
  path  = "/solution-accelerators/sa_manufacturing_and_procurement/factory-optimization"
}

resource "databricks_repo" "esg-scoring" {
  url   = "https://github.com/databricks-industry-solutions/esg-scoring.git"
  path  = "/solution-accelerators/sa_manufacturing_and_procurement/esg-scoring"
}

# ------------------------------------------------------------------------------------------------
# Quality ----------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------
# Supply Chain and Logistics ---------------------------------------------------------------------
resource "databricks_repo" "supply-chain-optimization" {
  url   = "https://github.com/databricks-industry-solutions/supply-chain-optimization.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/supply-chain-optimization"
}

resource "databricks_repo" "fine-grained-demand-forecasting" {
  url   = "https://github.com/databricks-industry-solutions/fine-grained-demand-forecasting.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/fine-grained-demand-forecasting"
}

resource "databricks_repo" "intermittent-forecasting" {
  url   = "https://github.com/databricks-industry-solutions/intermittent-forecasting.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/intermittent-forecasting"
}

resource "databricks_repo" "safety-stock" {
  url   = "https://github.com/databricks-industry-solutions/safety-stock.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/safety-stock"
}

resource "databricks_repo" "optimized-picking" {
  url   = "https://github.com/databricks-industry-solutions/optimized-picking.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/optimized-picking"
}

resource "databricks_repo" "on-shelf-availability" {
  url   = "https://github.com/databricks-industry-solutions/on-shelf-availability.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/on-shelf-availability"
}

resource "databricks_repo" "routing" {
  url   = "https://github.com/databricks-industry-solutions/routing.git"
  path  = "/solution-accelerators/sa_supplychain_and_logistics/routing"
}


# -----------------------------------------------------------------------------------------
# Digital and Retail ----------------------------------------------------------------------
resource "databricks_repo" "image-based-recommendations" {
  url   = "https://github.com/databricks-industry-solutions/image-based-recommendations.git"
  path  = "/solution-accelerators/sa_digital_and_retail/image-based-recommendations"
}

resource "databricks_repo" "market-basket-analysis" {
  url   = "https://github.com/databricks-industry-solutions/market-basket-analysis.git"
  path  = "/solution-accelerators/sa_digital_and_retail/market-basket-analysis"
}

resource "databricks_repo" "wide-and-deep" {
  url   = "https://github.com/databricks-industry-solutions/wide-and-deep.git"
  path  = "/solution-accelerators/sa_digital_and_retail/wide-and-deep"
}

resource "databricks_repo" "als-recommender" {
  url   = "https://github.com/databricks-industry-solutions/als-recommender.git"
  path  = "/solution-accelerators/sa_digital_and_retail/als-recommender"
}

resource "databricks_repo" "review-summarisation" {
  url   = "https://github.com/databricks-industry-solutions/review-summarisation.git"
  path  = "/solution-accelerators/sa_digital_and_retail/review-summarisation"
}

resource "databricks_repo" "pos-dlt" {
  url   = "https://github.com/databricks-industry-solutions/pos-dlt.git"
  path  = "/solution-accelerators/sa_digital_and_retail/pos-dlt"
}


# ---------------------------------------------------------------------------------------
# Customer Service ----------------------------------------------------------------------
resource "databricks_repo" "diy-llm-qa-bot" {
  url   = "https://github.com/databricks-industry-solutions/diy-llm-qa-bot.git"
  path  = "/solution-accelerators/sa_customer_service/diy-llm-qa-bot"
}

