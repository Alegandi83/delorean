resource "databricks_catalog" "das_postgre_sql_database" {
  depends_on      = [ databricks_connection.postgre_sql_db ]
  metastore_id    = var.metastore_id
  name            = "das_azure_postgres_database"
  connection_name = databricks_connection.postgre_sql_db.name
  comment         = "Managed from Terraform"
  isolation_mode  = "ISOLATED"
  force_destroy = true
  options = {
    database = var.postgresql_database_name
  }
}