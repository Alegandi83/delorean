# Creare una virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "avn-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Creare una subnet
resource "azurerm_subnet" "subnet" {
  name                 = "asb-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Creare un gruppo di sicurezza di rete per la VM
resource "azurerm_network_security_group" "powerbi_nsg" {
  name                = "nsg-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  # Regola per consentire RDP
  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Creare un'interfaccia di rete per la VM
resource "azurerm_network_interface" "powerbi_nic" {
  name                = "nic-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.powerbi_pip.id
  }
}

# Creare un IP pubblico per la VM
resource "azurerm_public_ip" "powerbi_pip" {
  name                = "pip-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

# Associare l'interfaccia di rete al gruppo di sicurezza
resource "azurerm_network_interface_security_group_association" "powerbi_nsg_association" {
  network_interface_id      = azurerm_network_interface.powerbi_nic.id
  network_security_group_id = azurerm_network_security_group.powerbi_nsg.id
}

# Creare un account di archiviazione per la diagnostica di avvio
resource "azurerm_storage_account" "powerbi_storage" {
  name                     = "dls${var.deploy_id}${var.deploy_env}vmpbi${var.deploy_ver}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Creare la VM Windows
resource "azurerm_windows_virtual_machine" "powerbi_vm" {
  name                = "avm-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  computer_name       = "vmpbi"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D4s_v3"  # Dimensione consigliata per Power BI Desktop
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.powerbi_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 256
  }


source_image_reference {
  publisher = "MicrosoftWindowsDesktop"
  offer     = "Windows-10"
  sku       = "win10-21h2-pro"
  version   = "latest"
}

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.powerbi_storage.primary_blob_endpoint
  }
}

/*
# Installare Power BI Desktop usando l'estensione VM
resource "azurerm_virtual_machine_extension" "powerbi_install" {
  name                 = "InstallPowerBIDesktop"
  virtual_machine_id   = azurerm_windows_virtual_machine.powerbi_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File powerbi_install.ps1",
      "fileUris": ["https://storageaccount.blob.core.windows.net/scripts/powerbi_install.ps1"]
    }
  SETTINGS

  # Oppure, se preferisci includere lo script direttamente:
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe' -OutFile 'C:\\PBIDesktopSetup.exe'; Start-Process -FilePath 'C:\\PBIDesktopSetup.exe' -ArgumentList '-quiet', '-norestart', 'ACCEPT_EULA=1' -Wait; Remove-Item 'C:\\PBIDesktopSetup.exe'\""
    }
  PROTECTED_SETTINGS
}
*/

# Output per recuperare l'indirizzo IP pubblico e la password della VM
output "powerbi_vm_public_ip" {
  value = azurerm_public_ip.powerbi_pip.ip_address
}