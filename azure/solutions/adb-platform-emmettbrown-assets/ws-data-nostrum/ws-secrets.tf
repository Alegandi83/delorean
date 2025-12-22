resource "databricks_secret_scope" "ws_scr_scope" {
  name      = "scp-ws-pipelines"
}

resource "databricks_secret_acl" "ws_scr_scope_acl" {
  depends_on = [ databricks_secret_scope.ws_scr_scope ]

  principal  = "users"
  permission = "MANAGE"
  scope      = databricks_secret_scope.ws_scr_scope.name
}

resource "databricks_secret" "scr_eventhub_key" {
  depends_on    = [ databricks_secret_acl.ws_scr_scope_acl ]
  
  key           = "scr-eventhub-key"
  string_value  = "${var.eh_accessKeyValue}"
  scope         = databricks_secret_scope.ws_scr_scope.name
}