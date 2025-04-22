resource "azurerm_data_factory" "adf" {
  name                = "adf-${var.deploy_id}-${var.deploy_env}-datafactory-${var.deploy_ver}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}
