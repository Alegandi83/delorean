
variable "metastore_id" {
  type        = string
  description = "the id of the metastore"
}

variable "workspace_url" {
  type        = string
  description = "the url of the workspace"
}

variable "adls_path" {
  type        = string
  description = "The ADLS path of the workspace storage external location"
}