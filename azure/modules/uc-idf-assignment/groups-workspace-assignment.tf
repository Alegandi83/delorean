# Assigning Databricks Account group to Databricks Workspace
resource "databricks_mws_permission_assignment" "this" {
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
