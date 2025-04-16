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


variable "eb_location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "cm_location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "deploy_id" {
  type        = string
  description = "(Required) The global unique identifier for the owner of deployment: e.g. ag83"
}

variable "eb_deploy_env" {
  type        = string
  description = "(Required) The environment for the deployment: e.g. tf"
}

variable "cm_deploy_env" {
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

variable "eb_producer_name" {
  type        = string
  description = "(Required) The name of the producer workspace: e.g. producer"
}

variable "eb_consumer_name" {
  type        = string
  description = "(Required) The name of the consumer workspace: e.g. producer"
}

variable "cm_producer_name" {
  type        = string
  description = "(Required) The name of the producer workspace: e.g. producer"
}

variable "cm_consumer_name" {
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

variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags to attach to resources"
  default     = {}
}

variable "create_resource_group" {
  type        = bool
  description = "(Optional) Creates resource group if set to true (default)"
  default     = true
}

variable "eb_account_groups" {
  type = list(object({
    name               = optional(string)
    permissions        = optional(list(string))
    users              = optional(set(string))
    service_principals = optional(set(string))
  }))
  description = "List of objects with these parameters -  group names to create, sets of users and/or service principals assigned to these groups"
  default     = []
}

variable "cm_account_groups" {
  type = list(object({
    name               = optional(string)
    permissions        = optional(list(string))
    users              = optional(set(string))
    service_principals = optional(set(string))
  }))
  description = "List of objects with these parameters -  group names to create, sets of users and/or service principals assigned to these groups"
  default     = []
}

variable "sql_admin_usr" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "sql_admin_psw" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
  default     = null
}

variable "github_usr" {
  type        = string
  description = "Github user to link databricks workspace to github"
  sensitive   = true
  default     = null
}

variable "github_tkn" {
  type        = string
  description = "Github token to link databricks workspace to github"
  sensitive   = true
  default     = null
}







