resource "databricks_catalog" "das_azure_sql_database" {
  depends_on      = [ databricks_connection.azure_sql_db ]
  metastore_id    = var.metastore_id
  name            = "das_azure_sql_database"
  connection_name = databricks_connection.azure_sql_db.name
  comment         = "Managed from Terraform"
  isolation_mode  = "ISOLATED"
  options = {
    database = var.sql_database_name
  }
}