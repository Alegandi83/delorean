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
    purpose = "external sqldb data source"
  }
}

resource "databricks_connection" "postgre_sql_db" {
  name            = "adb-postgre-sql-db"
  connection_type = "POSTGRESQL"
  comment         = "Created by TF"
  options = {
    host     = "${var.postgresql_server_name}.postgres.database.azure.com"
    port     = "5432"
    user     = var.sql_admin_usr
    password = var.sql_admin_psw
  }
  properties = {
    purpose = "external postgresql data source"
  }
}

resource "databricks_connection" "databricks_ws" {
  name            = "dbw-databricks-ws"
  connection_type = "DATABRICKS"
  comment         = "Created by TF"
  options = {
    host                    = replace("${var.dbw_federated_url}", "https://", "")
    personalAccessToken     = "${var.dbw_federated_pat}"
    httpPath                = "${var.dbw_federated_sql_http_path}"
  }
  properties = {
    purpose = "external databricks data source"
  }
}