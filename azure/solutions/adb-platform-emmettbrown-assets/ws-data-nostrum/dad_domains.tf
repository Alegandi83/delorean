resource "databricks_catalog" "dad_domains" {
  metastore_id    = var.metastore_id
  name            = "dad_domains"
  comment         = "dad_domains"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "OPEN"
}

resource "databricks_schema" "sales_and_commerce" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "sales_and_commerce"
  force_destroy = true
}

resource "databricks_schema" "service_and_customer_support" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "service_and_customer_support"
  force_destroy = true
}

resource "databricks_schema" "finance_and_accounting" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "finance_and_accounting"
  force_destroy = true
}

resource "databricks_schema" "supply_chain_and_logistics" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "supply_chain_and_logistics"
  force_destroy = true
}

resource "databricks_schema" "product_and_manufacturing" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "product_and_manufacturing"
  force_destroy = true
}

resource "databricks_schema" "marketing_and_dvertising" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "marketing_and_dvertising"
  force_destroy = true
}

resource "databricks_schema" "project_and_business_operations" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "project_and_business_operations"
  force_destroy = true
}