
variable "metastore_id" {
  type        = string
  description = "the id of the metastore"
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