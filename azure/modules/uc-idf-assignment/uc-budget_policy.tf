resource "databricks_budget_policy" "bdg_pl" {
  policy_name = "bpl-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${var.deploy_ver}"
  custom_tags = [{
    key = "env"
    value = var.deploy_env
  },
  {
    key = "component"
    value = var.component_name
  }]
}
