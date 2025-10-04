locals {
  # Creates maps of objects where key is in form like "user:<group_name>:<user_name>" and value is objects of two parameters,
  # first element is a group name and second is user name
  users_map = {
    for object in flatten([
      for group in var.account_groups : [
        for pair in setproduct([group.name], group.users) : {
          name = pair[0], user = pair[1]
      }] if alltrue([group.name != null, group.users != null])
    ]) : "user:${object.name}:${object.user}" => object
  }

  # Creates maps of objects where key is in form like "sp:<group_name>:<user_name>" and value is object of two parameters,
  # first element is a group name and second is service principal name
  service_principals_map = {
    for object in flatten([
      for group in var.account_groups : [
        for pair in setproduct([group.name], group.service_principals) : {
          name = pair[0], service_principal = pair[1]
      }] if alltrue([group.name != null, group.service_principals != null])
    ]) : "sp:${object.name}:${object.service_principal}" => object
  }

  # Creates a map of account groups where key is group name and value is boolean value to indicate if group has admin permissions
  admin_groups_map = {
    for group in var.account_groups : 
    group.name => contains(group.permissions, "ADMIN")
    if group.name != null && group.permissions != null
  }

}


# Reference to already existing User in Databricks Account
data "databricks_user" "this" {
  for_each = local.users_map
  user_name = each.value.user
  provider = databricks.account
}

# Creates Service Principals in Databricks Account
resource "databricks_service_principal" "this" {
  depends_on = [ databricks_metastore_assignment.this ]
  for_each = local.service_principals_map
  display_name = "sp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${each.value.service_principal}-${var.deploy_ver}"
  disable_as_user_deletion = false
  provider = databricks.account
}


# Assigns account_admin role to the service principals if sp name contains "admin"
resource "databricks_service_principal_role" "sp_admin" {
  depends_on = [ databricks_service_principal.this ] 
  for_each = {
    for k, v in local.service_principals_map : k => v
    if contains(split("-", lower(v.service_principal)), "admin")
  }
  service_principal_id = databricks_service_principal.this[each.key].id
  role = "account_admin"
  provider = databricks.account
}

# -- Service Principal OAuth secrets -----------------

# 1. Genera OAuth secrets per ogni service principal
resource "databricks_service_principal_secret" "oauth_secrets" {
  provider = databricks.account
  for_each = local.service_principals_map
  
  service_principal_id = databricks_service_principal.this[each.key].id
#  lifetime = 63072000s # 2 anni
}


# 2. Salva ogni OAuth secret nello scope
resource "databricks_secret" "scr_oauth_token" {
  depends_on   = [ databricks_secret_scope.scr_scope, databricks_service_principal_secret.oauth_secrets ]
  provider     = databricks.workspace  
  for_each     = local.service_principals_map
  
  key          = "scr-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${each.value.service_principal}-${var.deploy_ver}-token"
  string_value = databricks_service_principal_secret.oauth_secrets[each.key].secret
  scope        = databricks_secret_scope.scr_scope.name
}

resource "databricks_secret" "scr_oauth_uuid" {
  depends_on   = [ databricks_secret_scope.scr_scope, databricks_service_principal.this ]
  provider     = databricks.workspace  
  for_each     = local.service_principals_map
  
  key          = "scr-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${each.value.service_principal}-${var.deploy_ver}-uuid"
  string_value = databricks_service_principal.this[each.key].application_id
  scope        = databricks_secret_scope.scr_scope.name
}

# -- Groups Management -----------------


# Creates groups in Databricks Account
resource "databricks_group" "this" {
  depends_on = [ databricks_service_principal_role.sp_admin, databricks_metastore_assignment.this ]
  for_each = toset(compact(var.account_groups[*].name))
  display_name = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${each.key}-${var.deploy_ver}"
#  workspace_access = lookup(local.admin_groups_map, each.key, false)
#  databricks_sql_access = lookup(local.admin_groups_map, each.key, false)
  lifecycle { ignore_changes = [external_id, allow_cluster_create, allow_instance_pool_create, databricks_sql_access, workspace_access] }
  provider = databricks.account
}


# Adds Users and Service Principals to associated Databricks Account group
resource "databricks_group_member" "this" {
  depends_on = [ databricks_group.this ]
  for_each = merge(local.users_map, local.service_principals_map)
  group_id  = databricks_group.this[each.value.name].id
  member_id = startswith(each.key, "user") ? data.databricks_user.this[each.key].id : databricks_service_principal.this[each.key].id
  provider = databricks.account
}