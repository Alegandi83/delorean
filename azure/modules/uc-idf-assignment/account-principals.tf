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
}


# Reference to already existing User in Databricks Account
data "databricks_user" "this" {
  for_each = local.users_map
  user_name = each.value.user
}

# Reference to already existing Service Principal in Databricks Account
resource "databricks_service_principal" "this" {
  for_each = local.service_principals_map
  display_name = "sp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${each.value.service_principal}-${var.deploy_ver}"
  disable_as_user_deletion = false
}


# Creates group in Databricks Account
resource "databricks_group" "this" {
  for_each = toset(compact(var.account_groups[*].name))
  display_name = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${each.key}-${var.deploy_ver}"
  #workspace_access = contains(each.value["permissions"], "ADMIN") ? true : false
  #databricks_sql_access = contains(each.value["permissions"], "ADMIN") ? true : false
  lifecycle { ignore_changes = [external_id, allow_cluster_create, allow_instance_pool_create, databricks_sql_access, workspace_access] }
}


# Adds Users and Service Principals to associated Databricks Account group
resource "databricks_group_member" "this" {
  for_each = merge(local.users_map, local.service_principals_map)
  group_id  = databricks_group.this[each.value.name].id
  member_id = startswith(each.key, "user") ? data.databricks_user.this[each.key].id : databricks_service_principal.this[each.key].id
}