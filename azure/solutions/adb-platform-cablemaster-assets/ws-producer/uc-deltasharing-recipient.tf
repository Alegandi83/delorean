resource "databricks_recipient" "cablemaster2emmettbrown" {
  name                               = var.recipient_name
  comment                            = "made by terraform"
  authentication_type                = "DATABRICKS"
  data_recipient_global_metastore_id = var.recipient_id
}