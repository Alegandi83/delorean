variable "metastore_id" {
  type        = string
  description = "The ID of Unity Catalog metastore"
}

variable "workspace_id" {
  type        = string
  description = "The ID of Databricks workspace"
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

variable "component_name" {
  type        = string
  description = "(Required) The name of the component: e.g. producer or consumer" 
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
