resource "databricks_catalog" "dad_domains" {
  metastore_id    = var.metastore_id
  name            = "dad_domains"
  comment         = "dad_domains"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "OPEN"
}

resource "databricks_schema" "domain" {
  depends_on    = [databricks_catalog.dad_domains]
  catalog_name  = databricks_catalog.dad_domains.name
  name          = "domain"
  force_destroy = true
}