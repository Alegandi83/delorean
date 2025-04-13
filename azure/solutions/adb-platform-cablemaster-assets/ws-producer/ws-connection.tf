resource "databricks_connection" "azure_sql_db" {
  name            = "adb-azure-sql-db"
  connection_type = "SQLSERVER"
  comment         = "Created by TF"
  options = {
    host     = "${var.sql_server_host}.database.windows.net"
    port     = "1433"
    user     = var.sql_admin_usr
    password = var.sql_admin_psw
  }
  properties = {
    purpose = "external data source"
  }
}