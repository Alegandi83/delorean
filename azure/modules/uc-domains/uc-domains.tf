locals {
  domain_name = "dom_${var.deploy_id}_${var.domain.name}_${var.deploy_ver}"
  subdomain_names = {
    for name, subdomain in var.subdomains :
    name => "dom_${var.deploy_id}_${name}_${var.deploy_ver}"
  }
}

# Top-level Discover domain, bound to its governed tag
resource "databricks_domain" "domain" {
  domain_id   = local.domain_name
  tag_key     = databricks_tag_policy.domain.tag_key
  subtitle    = var.domain.subtitle
  description = var.domain.description
  draft       = var.draft
  icon = {
    name  = var.domain.icon.name
    color = var.domain.icon.color
  }
}

# Subdomains of the domain, each bound to its own governed tag
resource "databricks_domain" "subdomain" {
  for_each         = var.subdomains
  domain_id        = local.subdomain_names[each.key]
  tag_key          = databricks_tag_policy.subdomain[each.key].tag_key
  parent_domain_id = databricks_domain.domain.domain_id
  subtitle         = each.value.subtitle
  description      = each.value.description
  draft            = var.draft
  icon = {
    name  = each.value.icon.name
    color = each.value.icon.color
  }
}
