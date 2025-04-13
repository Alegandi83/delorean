resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${var.deploy_ver}"
  location = var.resource_group_location
}

resource "azurerm_mssql_server" "server" {
  name                         = "adb-${var.deploy_id}-${var.deploy_env}-sqlsrv-${var.deploy_ver}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "12.0"
  tags                         = var.tags 
}

resource "azurerm_mssql_firewall_rule" "allow_all" {
  name                = "AllowAllIPs"
  server_id           = azurerm_mssql_server.server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_mssql_database" "db" {
  name        = "adb-${var.deploy_id}-${var.deploy_env}-sqldb-${var.deploy_ver}"
  server_id   = azurerm_mssql_server.server.id
  sample_name = "AdventureWorksLT"
  tags        = var.tags
}