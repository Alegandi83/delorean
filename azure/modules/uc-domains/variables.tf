variable "deploy_id" {
  type        = string
  description = "(Required) The global unique identifier for the owner of deployment: e.g. ag83"
}

variable "deploy_ver" {
  type        = string
  description = "(Required) The version for the deployment: e.g. 001"
}

variable "domain" {
  type = object({
    name        = string
    subtitle    = string
    description = string
    icon = object({
      name  = string
      color = string
    })
  })
  description = "(Required) The top-level Discover domain. name is used to build the domain name dom_<deploy_id>_<name>_<deploy_ver> and the governed tag key tag_<deploy_id>_<name>_<deploy_ver>"
}

variable "subdomains" {
  type = map(object({
    subtitle    = string
    description = string
    icon = object({
      name  = string
      color = string
    })
  }))
  description = "(Optional) Subdomains of the domain, keyed by subdomain name. Each one is named dom_<deploy_id>_<key>_<deploy_ver> and gets its own governed tag tag_<deploy_id>_<key>_<deploy_ver>"
  default     = {}
}

variable "draft" {
  type        = bool
  description = "(Optional) Create domain and subdomains as drafts (not visible in Discover)"
  default     = false
}
