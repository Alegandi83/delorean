resource "azurerm_virtual_network" "vnet" {
  name                = "avn-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "asb-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "powerbi_nsg" {
  name                = "nsg-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  # Rule to allow RDP
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

# VM Public IP
resource "azurerm_public_ip" "powerbi_pip" {
  name                = "pip-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface_security_group_association" "powerbi_nsg_association" {
  network_interface_id      = azurerm_network_interface.powerbi_nic.id
  network_security_group_id = azurerm_network_security_group.powerbi_nsg.id
}

# Start diagnostic storage account
resource "azurerm_storage_account" "powerbi_storage" {
  name                     = "dls${var.deploy_id}${var.deploy_env}vmpbi${var.deploy_ver}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_windows_virtual_machine" "powerbi_vm" {
  name                = "avm-${var.deploy_id}-${var.deploy_env}-vmpbi-${var.deploy_ver}"
  computer_name       = "vmpbi"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D4s_v3"  # Suggested size for Power BI Desktop VM
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


# Install Power BI Desktop using VM extension
resource "azurerm_virtual_machine_extension" "powerbi_install" {
  name                 = "InstallPowerBIDesktop"
  virtual_machine_id   = azurerm_windows_virtual_machine.powerbi_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

/*
# uploaded script to install Power BI Desktop
  settings = <<SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File powerbi_install.ps1",
      "fileUris": ["https://storageaccount.blob.core.windows.net/scripts/powerbi_install.ps1"]
    }
  SETTINGS
*/

  # Inline Script to install Power BI Desktop
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe' -OutFile 'C:\\PBIDesktopSetup.exe'; Start-Process -FilePath 'C:\\PBIDesktopSetup.exe' -ArgumentList '-quiet', '-norestart', 'ACCEPT_EULA=1' -Wait; Remove-Item 'C:\\PBIDesktopSetup.exe'\""
    }
  PROTECTED_SETTINGS
}


# Output to retrieve VM public ip address
output "powerbi_vm_public_ip" {
  value = azurerm_public_ip.powerbi_pip.ip_address
}