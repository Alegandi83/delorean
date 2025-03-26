resource "databricks_catalog" "das_product_development" {
  metastore_id    = var.metastore_id
  name            = "das_product_development"
  comment         = "das product development"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "source1-schema" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "das_source1"
  force_destroy = true
}

resource "databricks_catalog" "dad_open_data" {
  metastore_id    = var.metastore_id
  name            = "dad_open_data"
  comment         = "open data"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "OPEN"
}

resource "databricks_schema" "demographics" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "demographics"
  force_destroy = true
}