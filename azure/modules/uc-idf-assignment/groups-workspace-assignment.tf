# Assigning Databricks Account group to Databricks Workspace

/*
data "databricks_user" "me" {
  depends_on = [ databricks_group.this ]
  user_name = "alessandro.gandini@databricks.com"
  provider = databricks.account
}
resource "databricks_mws_permission_assignment" "me_user" {
  
  depends_on = [ data.databricks_user.me ]
  workspace_id = var.workspace_id
  principal_id = data.databricks_user.me.id
  permissions  = ["ADMIN"]
  provider = databricks.account
}
*/

resource "databricks_mws_permission_assignment" "this" {
  provider = databricks.account
  depends_on = [ databricks_group_member.this ] // [ databricks_mws_permission_assignment.me_user ] 
  for_each = {
    for group in var.account_groups : group.name => group
    if group.name != null
  }

  workspace_id = var.workspace_id
  principal_id = databricks_group.this[each.key].id
  permissions  = each.value.permissions

  lifecycle {
    ignore_changes = [principal_id]
  } 
}


# Creates entitlements for ADMIN groups
resource "databricks_entitlements" "admin_entitlements" {
  provider = databricks.workspace  
  depends_on = [databricks_mws_permission_assignment.this, databricks_group.this]
  
  for_each = {
    for name, is_admin in local.admin_groups_map : 
    name => databricks_group.this[name].id
    if is_admin
  }
  
  group_id                    = each.value
  workspace_access            = true
  databricks_sql_access       = true
  allow_cluster_create        = true
  allow_instance_pool_create  = true
}

# -- User Personal Access Token -----------------

# 1. Genera PAT token for current user
resource "databricks_token" "pat" {
  provider     = databricks.workspace  
  comment  = "Terraform Provisioning"
  // 100 day token
  lifetime_seconds = 8640000
}

# 2. Salva PAT token nello scope
resource "databricks_secret" "scr_pat_token" {
  depends_on   = [ databricks_secret_scope.scr_scope, databricks_token.pat, databricks_entitlements.admin_entitlements ]
  provider     = databricks.workspace  
  key          = "scr-${var.deploy_id}-${var.deploy_env}-${var.component_name}-pat-${var.deploy_ver}-token"
  string_value = databricks_token.pat.token_value
  scope        = databricks_secret_scope.scr_scope.name
}