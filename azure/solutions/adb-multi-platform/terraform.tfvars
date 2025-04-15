tenant_id                       = "bf465dc7-3bc8-4944-b018-092572b5c20d"  
subscription_id                 = "edd4cc45-85c7-4aec-8bf5-648062d519bf"
account_id                      = "ccb842e7-2376-4152-b0b0-29fa952379b8"

deploy_id                       = "ag83"
deploy_prj                      = "test"        #project name
deploy_ver                      = "001"         #version

eb_location                     = "westeurope"
eb_deploy_env                   = "eb"          #environment / platform identifier
eb_producer_name                = "datanostrum"
eb_consumer_name                = "fungodata"

cm_location                     = "northeurope"
cm_deploy_env                   = "cm"          #environment / platform identifier
cm_producer_name                = "producer"
cm_consumer_name                = "consumer"

spoke_vnet_address_space        = "10.178.0.0/16"
private_subnet_address_prefixes = ["10.178.0.0/20"]
public_subnet_address_prefixes  = ["10.178.16.0/20"]

metastore_admins                = ["alessandro.gandini@databricks.com"]


eb_account_groups = [{
  name                = "admins"
  permissions         = ["ADMIN"]
  users               = ["alessandro.gandini@databricks.com", "luca.bolognesi@databricks.com"]
  service_principals  = ["admin"]
  }, {
  name                = "quality"
  permissions         = ["USER"]
  users               = ["andrea.calegari@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "service"
  permissions         = ["USER"]
  users               = ["andrea.picasso@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "marketing"
  permissions         = ["USER"]
  users               = ["davide.veneziano@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "supplychain"
  permissions         = ["USER"]
  users               = ["federico.rizzo@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "sales"
  permissions         = ["USER"]
  users               = ["lorenzo.tagliaferri@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "digital"
  permissions         = ["USER"]
  users               = ["luca.borin@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "manufacturing"
  permissions         = ["USER"]
  users               = ["mattia.zeni@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "legal"
  permissions         = ["USER"]
  users               = ["michele.lamarca@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "brand"
  permissions         = ["USER"]
  users               = ["mirco.meazzo@databricks.com"]
  service_principals  = ["user"]
  }
, {
  name                = "talent"
  permissions         = ["USER"]
  users               = ["luca.bolognesi@databricks.com"]
  service_principals  = ["user"]
  }
  ]

cm_account_groups = [{
  name                = "admins"
  permissions         = ["ADMIN"]
  users               = ["alessandro.gandini@databricks.com", "luca.bolognesi@databricks.com"]
  service_principals  = ["admin"]
  }, {
  name                = "users"
  permissions         = ["USER"]
  users               = [
    "andrea.calegari@databricks.com", 
    "andrea.picasso@databricks.com", 
    "davide.veneziano@databricks.com", 
    "federico.rizzo@databricks.com",
    "lorenzo.tagliaferri@databricks.com",
    "luca.borin@databricks.com",
    "mattia.zeni@databricks.com",
    "michele.lamarca@databricks.com",
    "mirco.meazzo@databricks.com"]
  service_principals  = ["user"]
}]

tags = {
  Owner = "alessandro.gandini@databricks.com"
} 