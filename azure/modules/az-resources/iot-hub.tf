resource "azurerm_iothub" "ih_namespace" {
  name                        = "aih-${var.deploy_id}-${var.deploy_env}-iothub-${var.deploy_ver}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  endpoint                     = []
  enrichment                   = []
  event_hub_partition_count    = 4
  event_hub_retention_in_days  = 7
  local_authentication_enabled = true
  min_tls_version              = "1.2"
  route                        = []
  sku {
    capacity = 1
    name     = "S1"
  }
  tags                        = var.tags
}

# Data source sulla policy esistente "iothubowner"
data "azurerm_iothub_shared_access_policy" "iothubowner" {
  name                = "iothubowner"
  resource_group_name = azurerm_resource_group.rg.name
  iothub_name         = azurerm_iothub.ih_namespace.name
}