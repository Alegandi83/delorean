output "domain_id" {
  value       = databricks_domain.domain.domain_id
  description = "The ID of the top-level domain"
}

output "domain_tag_key" {
  value       = databricks_tag_policy.domain.tag_key
  description = "The governed tag key of the top-level domain"
}

output "subdomain_ids" {
  value       = { for name, subdomain in databricks_domain.subdomain : name => subdomain.domain_id }
  description = "Map of subdomain name to subdomain ID"
}

output "subdomain_tag_keys" {
  value       = { for name, tag in databricks_tag_policy.subdomain : name => tag.tag_key }
  description = "Map of subdomain name to governed tag key"
}
