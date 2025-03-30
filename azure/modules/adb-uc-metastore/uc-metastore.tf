# metastore creation
resource "databricks_metastore" "databricks-metastore" {
  name          = var.metastore_name
  force_destroy = true
  region        = var.location
  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
  azurerm_storage_container.unity_catalog.name,
  azurerm_storage_account.unity_catalog.name)

  delta_sharing_organization_name = var.delta_sharing_organization_name
  delta_sharing_scope = "INTERNAL_AND_EXTERNAL"
  delta_sharing_recipient_token_lifetime_in_seconds = 0

}

# give access to the access connector that will be assumed by Unity Catalog to access data
resource "databricks_metastore_data_access" "access-connector-data-access" {
  metastore_id = databricks_metastore.databricks-metastore.id
  name         = var.access_connector_name
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.access_connector.id
  }
  is_default    = true
  force_destroy = true
}
