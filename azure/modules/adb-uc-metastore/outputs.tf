output "metastore_id" {
  value = databricks_metastore.databricks-metastore.id
}

output "global_metastore_id" {
  value = databricks_metastore.databricks-metastore.global_metastore_id
  description = "the global mestastore id of the metastore used for delta sharing"
}

output "access_connector_id" {
  value       = azurerm_databricks_access_connector.access_connector.id
  description = "the id of the access connector"
}

output "access_connector_principal_id" {
  value       = azurerm_databricks_access_connector.access_connector.identity[0].principal_id
  description = "The Principal ID of the System Assigned Managed Service Identity that is configured on this Access Connector"
}

output "shared_resource_group_name" {
  value       = var.shared_resource_group_name
  description = "The resource group name where the storage account of the metastore is deployed"
}
