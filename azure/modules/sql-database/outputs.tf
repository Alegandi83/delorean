output "sql_server_name" {
  value = azurerm_mssql_server.server.name
}

output "sql_database_name" {
  value = azurerm_mssql_database.db.name
}