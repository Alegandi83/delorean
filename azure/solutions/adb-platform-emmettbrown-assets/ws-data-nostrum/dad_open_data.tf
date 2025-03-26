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

resource "databricks_schema" "locations" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "locations"
  force_destroy = true
}

resource "databricks_schema" "market" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "market"
  force_destroy = true
}

resource "databricks_schema" "news" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "news"
  force_destroy = true
}

resource "databricks_schema" "retail" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "retail"
  force_destroy = true
}

resource "databricks_schema" "time" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "time"
  force_destroy = true
}

resource "databricks_schema" "weather" {
  depends_on    = [databricks_catalog.dad_open_data]
  catalog_name  = databricks_catalog.dad_open_data.name
  name          = "weather"
  force_destroy = true
}