
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
  description = "(Required) The component name of the deployment: fungodata"
}

variable "metastore_id" {
  type        = string
  description = "the id of the metastore"
}

variable "workspace_url" {
  type        = string
  description = "the url of the workspace"
}

variable "budget_policy_id" {
  type        = string
  description = "the id of the workspace budget policy"
}

variable "adls_path" {
  type        = string
  description = "The ADLS path of the workspace storage external location"
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
