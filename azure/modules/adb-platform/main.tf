locals {
  metastore_name = "hub"
}
module "adb-lakehouse-uc-metastore" {
  source                          = "../adb-uc-metastore"
  metastore_storage_name          = "dls${var.deploy_id}${var.deploy_env}${local.metastore_name}${var.deploy_ver}"
  metastore_name                  = "mts-${var.deploy_id}-${var.deploy_env}-${local.metastore_name}-${var.deploy_ver}"
  access_connector_name           = "dac-${var.deploy_id}-${var.deploy_env}-${local.metastore_name}-${var.deploy_ver}"
  shared_resource_group_name      = "rg-${var.deploy_id}-${var.deploy_env}-${local.metastore_name}-${var.deploy_ver}"
  delta_sharing_organization_name = "azure:${var.location}:${var.deploy_id}-${var.platform_name}-${var.deploy_ver}"
  location                        = var.location
  tags                            = merge(var.tags, { "Domain" = "${local.metastore_name}" })
  providers = {
    databricks = databricks.account
  }
}

module "adb-lakehouse-producer" {
  # With UC by default we need to explicitly create a UC metastore, otherwise it will be created automatically
  depends_on                      = [module.adb-lakehouse-uc-metastore]
  source                          = "../adb-lakehouse"
  deploy_id                       = var.deploy_id
  deploy_env                      = var.deploy_env
  deploy_prj                      = var.deploy_prj
  deploy_ver                      = var.deploy_ver
  component_name                  = "${var.producer_name}"
  location                        = var.location
  spoke_vnet_address_space        = var.spoke_vnet_address_space
  spoke_resource_group_name       = "rg-${var.deploy_id}-${var.deploy_env}-${var.producer_name}-${var.deploy_ver}"
  create_resource_group           = true
  managed_resource_group_name     = "rg-${var.deploy_id}-${var.deploy_env}-${var.producer_name}-${var.deploy_ver}-mngd"
  databricks_workspace_name       = "dbw-${var.deploy_id}-${var.deploy_env}-${var.producer_name}-${var.deploy_ver}"
  data_factory_name               = "" #"adf-${var.deploy_id}-${var.deploy_env}-${local.producer_name}-${var.deploy_ver}"
  key_vault_name                  = "" #"akv-${var.deploy_id}-${var.deploy_env}-${local.producer_name}-${var.deploy_ver}"
  private_subnet_address_prefixes = var.private_subnet_address_prefixes
  public_subnet_address_prefixes  = var.public_subnet_address_prefixes
  storage_account_name            = "dls${var.deploy_id}${var.deploy_env}${var.producer_name}${var.deploy_ver}"
  tags                            = merge(var.tags, { "Domain" = "${var.producer_name}" })
}


module "adb-lakehouse-uc-idf-assignment-producer" {
  depends_on         = [module.adb-lakehouse-producer]
  source             = "../uc-idf-assignment"
  workspace_id       = module.adb-lakehouse-producer.workspace_id
  deploy_id          = var.deploy_id
  deploy_env         = var.deploy_env
  deploy_prj         = var.deploy_prj
  deploy_ver         = var.deploy_ver
  metastore_id       = module.adb-lakehouse-uc-metastore.metastore_id
  component_name     = var.producer_name
  account_groups     = var.account_groups
  metastore_admins   = var.metastore_admins 
  providers = {
    databricks = databricks.account
  }
}


module "adb-lakehouse-consumer" {
  # With UC by default we need to explicitly create a UC metastore, otherwise it will be created automatically
  depends_on                      = [module.adb-lakehouse-uc-metastore]
  source                          = "../adb-lakehouse"
  deploy_id                       = var.deploy_id
  deploy_env                      = var.deploy_env
  deploy_prj                      = var.deploy_prj
  deploy_ver                      = var.deploy_ver
  component_name                  = "${var.consumer_name}"
  location                        = var.location
  spoke_vnet_address_space        = var.spoke_vnet_address_space
  spoke_resource_group_name       = "rg-${var.deploy_id}-${var.deploy_env}-${var.consumer_name}-${var.deploy_ver}"
  create_resource_group           = true
  managed_resource_group_name     = "rg-${var.deploy_id}-${var.deploy_env}-${var.consumer_name}-${var.deploy_ver}-mngd"
  databricks_workspace_name       = "dbw-${var.deploy_id}-${var.deploy_env}-${var.consumer_name}-${var.deploy_ver}"
  data_factory_name               = "" #"adf-${var.deploy_id}-${var.deploy_env}-${local.consumer_name}-${var.deploy_ver}"
  key_vault_name                  = "" #"akv-${var.deploy_id}-${var.deploy_env}-${local.consumer_name}-${var.deploy_ver}"
  private_subnet_address_prefixes = var.private_subnet_address_prefixes
  public_subnet_address_prefixes  = var.public_subnet_address_prefixes
  storage_account_name            = "dls${var.deploy_id}${var.deploy_env}${var.consumer_name}${var.deploy_ver}"
  tags                            = merge(var.tags, { "Domain" = "${var.consumer_name}" })
}



module "adb-lakehouse-uc-idf-assignment-consumer" {
  depends_on         = [module.adb-lakehouse-consumer]
  source             = "../uc-idf-assignment"
  workspace_id       = module.adb-lakehouse-consumer.workspace_id
  deploy_id          = var.deploy_id
  deploy_env         = var.deploy_env
  deploy_prj         = var.deploy_prj
  deploy_ver         = var.deploy_ver
  metastore_id       = module.adb-lakehouse-uc-metastore.metastore_id
  component_name     = var.consumer_name
  account_groups     = var.account_groups
  metastore_admins   = var.metastore_admins 
  providers = {
    databricks = databricks.account
  }
}


locals {
  landing_name = "land"
}
module "adb-lakehouse-common-assets" {
  depends_on                     = [module.adb-lakehouse-uc-metastore]
  source                         = "../adb-lakehouse-uc/uc-common-assets"
  location                       = var.location
  storage_credential_name        = "dac-${var.deploy_id}-${var.deploy_env}-${local.metastore_name}-${var.deploy_ver}"
  metastore_id                   = module.adb-lakehouse-uc-metastore.metastore_id
  access_connector_id            = module.adb-lakehouse-uc-metastore.access_connector_principal_id
  landing_external_location_name = "dls${var.deploy_id}${var.deploy_env}${local.landing_name}${var.deploy_ver}"
  landing_adls_path              = format("abfss://%s@%s.dfs.core.windows.net/", "con", "dls${var.deploy_id}${var.deploy_env}${local.landing_name}${var.deploy_ver}")
  landing_adls_rg                = module.adb-lakehouse-uc-metastore.shared_resource_group_name
  metastore_admins               = var.metastore_admins
  tags                           = merge(var.tags, { "Domain" = "${local.landing_name}" })
  providers = {
    databricks = databricks.producer-workspace
  }
}

locals {
  producer_assets_name = "producer-assets"
}
module "adb-lakehouse-producer-workspace-assets" {
  depends_on                     = [module.adb-lakehouse-common-assets]
  source                         = "../adb-lakehouse-uc/uc-workspace-assets"
  access_connector_id            = module.adb-lakehouse-producer.access_connector_principal_id
  storage_credential_name        = module.adb-lakehouse-producer.access_connector_name
  external_location_name         = module.adb-lakehouse-producer.storage_account_name
  adls_path                      = format("abfss://%s@%s.dfs.core.windows.net/", "con", module.adb-lakehouse-producer.storage_account_name)
  metastore_admins               = var.metastore_admins
  tags                           = merge(var.tags, { "Domain" = "${local.producer_assets_name}" })
  providers = {
    databricks = databricks.producer-workspace
  }
}

locals {
  consumer_assets_name = "consumer-assets"
}
module "adb-lakehouse-consumer-workspace-assets" {
  depends_on                     = [module.adb-lakehouse-producer-workspace-assets]
  source                         = "../adb-lakehouse-uc/uc-workspace-assets"
  access_connector_id            = module.adb-lakehouse-consumer.access_connector_principal_id
  storage_credential_name        = module.adb-lakehouse-consumer.access_connector_name
  external_location_name         = module.adb-lakehouse-consumer.storage_account_name
  adls_path                      = format("abfss://%s@%s.dfs.core.windows.net/", "con", module.adb-lakehouse-consumer.storage_account_name)
  metastore_admins               = var.metastore_admins
  tags                           = merge(var.tags, { "Domain" = "${local.producer_assets_name}" })
  providers = {
    databricks = databricks.consumer-workspace
  }
}
