resource "azurerm_key_vault" "kv" {
  name                        = "akv-${var.deploy_id}-${var.deploy_env}-keyvault-${var.deploy_ver}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  tags                        = var.tags
}
