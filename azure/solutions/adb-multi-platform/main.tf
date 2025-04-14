locals {
  src_platform_name = "resources"
}
module "slq-database" {
  source                            = "../../modules/sql-database"
  resource_group_location           = var.cm_location
  deploy_id                         = var.deploy_id
  deploy_env                        = var.cm_deploy_env
  deploy_prj                        = var.deploy_prj
  deploy_ver                        = var.deploy_ver
  component_name                    = local.src_platform_name 
  admin_username                    = var.sql_admin_usr
  admin_password                    = var.sql_admin_psw
  tags                              = merge(var.tags, { "Domain" = "${local.src_platform_name}" })
  providers = {
    azurerm = azurerm
  }
}

locals {
  eb_platform_name = "emmettbrown"
}
module "adb-platform-emmettbrown" {
  source                            = "../../modules/adb-platform"
  tenant_id                         = var.tenant_id             
  subscription_id                   = var.subscription_id
  account_id                        = var.account_id
  location                          = var.eb_location
  deploy_id                         = var.deploy_id
  deploy_env                        = var.eb_deploy_env
  deploy_prj                        = var.deploy_prj
  deploy_ver                        = var.deploy_ver
  producer_name                     = var.eb_producer_name
  consumer_name                     = var.eb_consumer_name
  spoke_vnet_address_space          = var.spoke_vnet_address_space
  private_subnet_address_prefixes   = var.private_subnet_address_prefixes
  public_subnet_address_prefixes    = var.public_subnet_address_prefixes
  metastore_admins                  = var.metastore_admins
  account_groups                    = var.eb_account_groups  
  platform_name                     = local.eb_platform_name
  tags                              = merge(var.tags, { "Domain" = "${local.eb_platform_name}" })
} 


module "adb-platform-emmettbrown-producer-assets" {
  depends_on                        = [module.adb-platform-emmettbrown]
  source                            = "../adb-platform-emmettbrown-assets/ws-data-nostrum"
  deploy_id                         = var.deploy_id
  deploy_env                        = var.eb_deploy_env
  deploy_prj                        = var.deploy_prj
  deploy_ver                        = var.deploy_ver
  component_name                    = var.eb_producer_name 
  metastore_id                      = module.adb-platform-emmettbrown.platform_metastore_id
  workspace_url                     = module.adb-platform-emmettbrown.producer_workspace_url
  adls_path                         = module.adb-platform-emmettbrown.producer_storage_url
  providers = {
    databricks = databricks.emmettbrown-producer-workspace
  }
}

module "adb-platform-emmettbrown-consumer-assets" {
  depends_on                        = [module.adb-platform-emmettbrown]
  source                            = "../adb-platform-emmettbrown-assets/ws-fungo-data"
  deploy_id                         = var.deploy_id
  deploy_env                        = var.eb_deploy_env
  deploy_prj                        = var.deploy_prj
  deploy_ver                        = var.deploy_ver
  component_name                    = var.eb_consumer_name 
  metastore_id                      = module.adb-platform-emmettbrown.platform_metastore_id
  workspace_url                     = module.adb-platform-emmettbrown.consumer_workspace_url
  adls_path                         = module.adb-platform-emmettbrown.consumer_storage_url
  providers = {
    databricks = databricks.emmettbrown-consumer-workspace
  }
}


locals {
  cm_platform_name = "cablemaster"
}
module "adb-platform-cablemaster" {
  source                            = "../../modules/adb-platform"
  tenant_id                         = var.tenant_id             
  subscription_id                   = var.subscription_id
  account_id                        = var.account_id
  location                          = var.cm_location
  deploy_id                         = var.deploy_id
  deploy_env                        = var.cm_deploy_env
  deploy_prj                        = var.deploy_prj
  deploy_ver                        = var.deploy_ver
  producer_name                     = var.cm_producer_name
  consumer_name                     = var.cm_consumer_name
  spoke_vnet_address_space          = var.spoke_vnet_address_space
  private_subnet_address_prefixes   = var.private_subnet_address_prefixes
  public_subnet_address_prefixes    = var.public_subnet_address_prefixes
  metastore_admins                  = var.metastore_admins  
  account_groups                    = var.cm_account_groups  
  platform_name                     = local.cm_platform_name
  tags                              = merge(var.tags, { "Domain" = "${local.cm_platform_name}" })
}

module "adb-platform-cablemaster-producer-assets" {
  depends_on                        = [module.adb-platform-cablemaster, module.slq-database]
  source                            = "../adb-platform-cablemaster-assets/ws-producer"
  deploy_id                         = var.deploy_id
  deploy_env                        = var.cm_deploy_env
  deploy_prj                        = var.deploy_prj
  deploy_ver                        = var.deploy_ver
  component_name                    = var.cm_producer_name 
  metastore_id                      = module.adb-platform-cablemaster.platform_metastore_id
  workspace_url                     = module.adb-platform-cablemaster.producer_workspace_url
  recipient_id                      = module.adb-platform-emmettbrown.platform_global_metastore_id
  recipient_name                    = local.eb_platform_name
  adls_path                         = module.adb-platform-cablemaster.producer_storage_url
  sql_server_host                   = module.slq-database.sql_server_name
  sql_database_name                 = module.slq-database.sql_database_name
  sql_admin_usr                     = var.sql_admin_usr
  sql_admin_psw                     = var.sql_admin_psw
  providers = {
    databricks = databricks.cablemaster-producer-workspace
  }
}

module "adb-platform-cablemaster-consumer-assets" {
  depends_on                        = [module.adb-platform-cablemaster]
  source                            = "../adb-platform-cablemaster-assets/ws-consumer"
  deploy_id                         = var.deploy_id
  deploy_env                        = var.cm_deploy_env
  deploy_prj                        = var.deploy_prj
  component_name                    = var.cm_consumer_name 
  deploy_ver                        = var.deploy_ver
  metastore_id                      = module.adb-platform-cablemaster.platform_metastore_id
  workspace_url                     = module.adb-platform-cablemaster.consumer_workspace_url
  adls_path                         = module.adb-platform-cablemaster.consumer_storage_url
  providers = {
    databricks = databricks.cablemaster-consumer-workspace
  }
}