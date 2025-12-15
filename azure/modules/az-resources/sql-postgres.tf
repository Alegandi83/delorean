resource "azurerm_postgresql_flexible_server" "psqlserver" {
  name                = "aps-${var.deploy_id}-${var.deploy_env}-psqlserver-${var.deploy_ver}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B_Standard_B1ms"

  storage_mb                   = 32768
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  zone                        = "1"

  administrator_login          = var.admin_username
  administrator_password       = var.admin_password
  version                      = "17"

}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name                = "AllowAllIPs"
  server_id           = azurerm_postgresql_flexible_server.psqlserver.id
  start_ip_address    = "0.0.0.1"
  end_ip_address      = "255.255.255.254"
}

resource "azurerm_postgresql_flexible_server_database" "psqldatabase" {
  name                = "pdb-${var.deploy_id}-${var.deploy_env}-psqldatabase-${var.deploy_ver}"
  server_id           = azurerm_postgresql_flexible_server.psqlserver.id
  charset             = "UTF8"
  collation           = "en_US.utf8"

}