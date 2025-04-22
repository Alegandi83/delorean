resource "databricks_secret_scope" "scr_scope" {
  provider  = databricks.workspace
  name      = "scp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${var.deploy_ver}"
}

resource "databricks_secret_acl" "scr_scope_acl" {
  provider   = databricks.workspace
  depends_on = [ databricks_secret_scope.scr_scope ]

  principal  = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-admins-${var.deploy_ver}"
  permission = "MANAGE"
  scope      = databricks_secret_scope.scr_scope.name
}

/*
resource "databricks_secret" "scr_account_id" {
  provider      = databricks.workspace
  depends_on    = [ databricks_secret_scope.scr_scope ]
  
  key           = "scr_account_id"
  string_value  = "value"
  scope         = databrikcs.account.host
}
*/