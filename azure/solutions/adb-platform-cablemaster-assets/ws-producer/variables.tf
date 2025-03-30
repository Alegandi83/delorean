
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