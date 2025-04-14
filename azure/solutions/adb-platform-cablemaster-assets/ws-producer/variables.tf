
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
  description = "(Required) The component name of the deployment: producer"
}

variable "metastore_id" {
  type        = string
  description = "the id of the metastore"
}

variable "workspace_url" {
  type        = string
  description = "the url of the workspace"
}

variable "recipient_id" {
  type        = string
  description = "Global ID of the recipient Metastore. Used for delta sharing"
}

variable "recipient_name" {
  type        = string
  description = "Name of the recipient. Used for delta sharing"
}

variable "adls_path" {
  type        = string
  description = "The ADLS path of the workspace storage external location"
}

variable "sql_server_host" {
  type        = string
  description = "The host of the SQL logical server."
}

variable "sql_database_name" {
  type        = string
  description = "The host of the SQL logical server."
}

variable "sql_admin_usr" {
  type        = string
  description = "The administrator username of the SQL logical server."
}

variable "sql_admin_psw" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
}