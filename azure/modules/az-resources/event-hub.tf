resource "azurerm_eventhub_namespace" "eh_namespace" {
  name                        = "aeh-${var.deploy_id}-${var.deploy_env}-eventhub-${var.deploy_ver}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  auto_inflate_enabled        = false
  capacity                    = 3
  sku                         = "Standard"
  tags                        = var.tags

  public_network_access_enabled = true
  network_rulesets = [{
    default_action                 = "Allow"
    ip_rule                        = []
    public_network_access_enabled  = true
    trusted_service_access_enabled = false
    virtual_network_rule           = []
  }]

}

resource "azurerm_eventhub" "eh" {
  name                = "eventhub-${var.deploy_ver}"
  namespace_id        = azurerm_eventhub_namespace.eh_namespace.id
  partition_count     = 1
  status              = "Active"
  retention_description {
    cleanup_policy                    = "Delete"
    retention_time_in_hours           = 168
  }
}

resource "azurerm_eventhub_consumer_group" "eh_consumer_group" {
  name                = "ehConsumerGroup"
  namespace_name      = azurerm_eventhub_namespace.eh_namespace.name
  eventhub_name       = azurerm_eventhub.eh.name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_eventhub_authorization_rule" "eh_auth_rule" {
  name                = "aar-${var.deploy_id}-${var.deploy_env}-eventhub-${var.deploy_ver}"
  namespace_name      = azurerm_eventhub_namespace.eh_namespace.name
  eventhub_name       = azurerm_eventhub.eh.name
  resource_group_name = azurerm_resource_group.rg.name

  listen = true
  send   = true
  manage = true
}