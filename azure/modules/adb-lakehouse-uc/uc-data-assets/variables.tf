variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}
variable "storage_credential_name" {
  type        = string
  description = "the name of the storage credential"
}

variable "metastore_id" {
  type        = string
  description = "Id of the metastore"
}

variable "metastore_admins" {
  type        = list(string)
  description = "list of principals: service principals or groups that have metastore admin privileges"
}

variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags to attach to resources"
}