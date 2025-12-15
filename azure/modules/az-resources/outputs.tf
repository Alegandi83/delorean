output "sql_server_name" {
  value = azurerm_mssql_server.server.name
}

output "sql_database_name" {
  value = azurerm_mssql_database.db.name
}

output "postgresql_server_name" {
  value = azurerm_postgresql_flexible_server.psqlserver.name
}

output "postgresql_database_name" {
  value = azurerm_postgresql_flexible_server_database.psqldatabase.name
}

output "eh_namespace" {
  value = azurerm_eventhub_namespace.eh_namespace.name
}

output "eh_entityname" {
  value = azurerm_eventhub.eh.name
}

output "eh_accessKeyName" {
  value = azurerm_eventhub_authorization_rule.eh_auth_rule.name
}

output "eh_accessKeyValue" {
  value = azurerm_eventhub_authorization_rule.eh_auth_rule.primary_key
}

output "ih_namespace" {
  # extract the namespace name from the event hub endpoint
  value = regex(
    "^sb://([^\\.]+)\\.servicebus\\.windows\\.net/?$",
    azurerm_iothub.ih_namespace.event_hub_events_endpoint
  )[0]
 
}

output "ih_entityname" {
  value = azurerm_iothub.ih_namespace.name
}

output "ih_accessKeyName" {
  value = data.azurerm_iothub_shared_access_policy.iothubowner.name
}

output "ih_accessKeyValue" {
  value = data.azurerm_iothub_shared_access_policy.iothubowner.primary_key
}

output "ih_event_hub_events_endpoint" {
  value = azurerm_iothub.ih_namespace.event_hub_events_endpoint
}


output "ih_service_connection_string" {
  value = data.azurerm_iothub_shared_access_policy.iothubowner.primary_connection_string
}