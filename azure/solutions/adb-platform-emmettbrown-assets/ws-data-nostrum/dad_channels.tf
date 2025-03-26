resource "databricks_catalog" "dad_channels" {
  metastore_id    = var.metastore_id
  name            = "dad_channels"
  comment         = "dad_channels"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "OPEN"
}

resource "databricks_schema" "channel" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "channel"
  force_destroy = true
}