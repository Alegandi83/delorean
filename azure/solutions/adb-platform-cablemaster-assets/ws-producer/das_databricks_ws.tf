resource "databricks_catalog" "das_databricks_ws" {
  depends_on      = [ databricks_connection.databricks_ws ]
  metastore_id    = var.metastore_id
  name            = "das_databricks_ws"
  connection_name = databricks_connection.databricks_ws.name
  comment         = "Managed from Terraform"
  isolation_mode  = "ISOLATED"
  force_destroy = true
  options = {
    catalog = "dad_open_data"
  }
}