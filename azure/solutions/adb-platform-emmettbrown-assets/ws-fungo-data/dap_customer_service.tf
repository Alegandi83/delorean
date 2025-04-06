resource "databricks_catalog" "dap_customer_service" {
  metastore_id    = var.metastore_id
  name            = "dap_customer_service"
  comment         = "dap_customer_service"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "field_service_assistant" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "field_service_assistant"
  force_destroy = true
}

resource "databricks_schema" "customer_service_analytics" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "customer_service_analytics"
  force_destroy = true
}

resource "databricks_schema" "product_warranty_optimization" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "product_warranty_optimization"
  force_destroy = true
}

resource "databricks_schema" "customer_service_agent" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "customer_service_agent"
  force_destroy = true
}