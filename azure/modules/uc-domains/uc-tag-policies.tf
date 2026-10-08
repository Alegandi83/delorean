locals {
  domain_tag_key = "tag_${var.deploy_id}_${var.domain.name}_${var.deploy_ver}"
  subdomain_tag_keys = {
    for name, subdomain in var.subdomains :
    name => "tag_${var.deploy_id}_${name}_${var.deploy_ver}"
  }
}

# Governed tag (account level) backing the top-level domain
resource "databricks_tag_policy" "domain" {
  tag_key     = local.domain_tag_key
  description = "Governed tag of the ${var.domain.name} domain. ${var.domain.subtitle}"
}

# One governed tag (account level) per subdomain
resource "databricks_tag_policy" "subdomain" {
  for_each    = var.subdomains
  tag_key     = local.subdomain_tag_keys[each.key]
  description = "Governed tag of the ${var.domain.name}/${each.key} subdomain. ${each.value.subtitle}"
}
