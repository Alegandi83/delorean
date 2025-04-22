# Assigning Databricks Account group to Databricks Workspace
resource "databricks_mws_permission_assignment" "this" {
  provider = databricks.account
  depends_on = [ databricks_group.this ]
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