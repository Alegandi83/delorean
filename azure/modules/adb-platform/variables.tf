variable "tenant_id" {
  type        = string
  description = "Azure Tenand ID to deploy the workspace into"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID to deploy the workspace into"
}

variable "account_id" {
  type        = string
  description = "Databricks Account ID"
}


variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "deploy_id" {
  type        = string
  description = "(Required) The global unique identifier for the owner of deployment: e.g. ag83"
}

variable "deploy_env" {
  type        = string
  description = "(Required) The environment for the deployment: e.g. tf"
}

variable "deploy_prj" {
  type        = string
  description = "(Required) The prject name for the deployment: e.g. test"
}

variable "deploy_ver" {
  type        = string
  description = "(Required) The version for the deployment: e.g. 001"
}

variable "producer_name" {
  type        = string
  description = "(Required) The name of the producer workspace: e.g. producer"
}

variable "consumer_name" {
  type        = string
  description = "(Required) The name of the consumer workspace: e.g. producer"
}

variable "spoke_vnet_address_space" {
  type        = string
  description = "(Required) The address space for the spoke Virtual Network"
}

variable "private_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for private Databricks subnet"
}

variable "public_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for public Databricks subnet"
}

variable "metastore_admins" {
  type        = list(string)
  description = "list of principals: service principals or groups that have metastore admin privileges"
}


variable "platform_name" {
  type        = string
  description = "the name of the platform. Used as delta sharing organization name. e.g. cablemaster"
}
variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags to attach to resources"
  default     = {}
}


variable "account_groups" {
  type = list(object({
    name               = optional(string)
    permissions        = optional(list(string))
    users              = optional(set(string))
    service_principals = optional(set(string))
  }))
  description = "List of objects with these parameters -  group names to create, sets of users and/or service principals assigned to these groups"
  default     = []
}



