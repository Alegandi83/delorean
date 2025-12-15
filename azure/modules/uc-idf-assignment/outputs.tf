output "budget_policy_id" {
  description = "The Budget Policy ID"
  value       = databricks_budget_policy.bdg_pl.policy_id
}

output "user_pat" {
  description = "The user PAT token"
  value       = databricks_token.pat.token_value
}