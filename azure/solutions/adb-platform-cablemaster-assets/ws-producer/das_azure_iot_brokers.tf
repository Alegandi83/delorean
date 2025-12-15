resource "databricks_catalog" "das_azure_iot_brokers" {
  metastore_id    = var.metastore_id
  name            = "das_azure_iot_brokers"
  comment         = "Managed from Terraform"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "azure_eventhub" {
  depends_on    = [databricks_catalog.das_azure_iot_brokers]
  catalog_name  = databricks_catalog.das_azure_iot_brokers.name
  name          = "azure_eventhub"
  force_destroy = true
}

resource "databricks_schema" "azure_iothub" {
  depends_on    = [databricks_catalog.das_azure_iot_brokers]
  catalog_name  = databricks_catalog.das_azure_iot_brokers.name
  name          = "azure_iothub"
  force_destroy = true
}