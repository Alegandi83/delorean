terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.52.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
  resource_provider_registrations = "none"
}

provider "databricks" {
  alias      = "account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.account_id
  azure_tenant_id = var.tenant_id
}

#emmettbrown-provider
provider "databricks" {
  alias = "emmettbrown-producer-workspace"
  host  = module.adb-platform-emmettbrown.producer_workspace_url
  azure_tenant_id = var.tenant_id
}

provider "databricks" {
  alias = "emmettbrown-consumer-workspace"
  host  = module.adb-platform-emmettbrown.consumer_workspace_url
  azure_tenant_id = var.tenant_id
}

#cablemaster-provider
provider "databricks" {
  alias = "cablemaster-producer-workspace"
  host  = module.adb-platform-cablemaster.producer_workspace_url
  azure_tenant_id = var.tenant_id
}

provider "databricks" {
  alias = "cablemaster-consumer-workspace"
  host  = module.adb-platform-cablemaster.consumer_workspace_url
  azure_tenant_id = var.tenant_id
}