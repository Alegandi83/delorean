resource "databricks_pipeline" "pipeline_event_hub_pipeline" {
  depends_on  = [databricks_repo.cablemaster, databricks_secret.scr_eventhub_key]

  name       = "Event Hub pipeline"
  catalog    = "das_azure_iot_brokers"
  schema     = "azure_eventhub"
  photon     = true
  serverless = true

  configuration = {
    "iot.ingestion.eh.namespace"                 = "${var.eh_namespace}"
    "iot.ingestion.eh.name"                      = "${var.eh_entityname}"
    "iot.ingestion.eh.accessKeyName"             = "${var.eh_accessKeyName}"
    "io.ingestion.eh.secretsScopeName"           = databricks_secret_scope.ws_scr_scope.name
    "io.ingestion.eh.secretName"                 = databricks_secret.scr_eventhub_key.key
    "iot.ingestion.spark.maxOffsetsPerTrigger"   = "50000"
    "iot.ingestion.spark.startingOffsets"        = "latest"
    "iot.ingestion.spark.failOnDataLoss"         = "false"
    "iot.ingestion.kafka.requestTimeout"         = "60000"
    "iot.ingestion.kafka.sessionTimeout"         = "30000"
  }

  library {
    glob {
      include = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/producer/das_azure_iot_brokers/Azure Event Hub pipeline/transformations/**"
    }
  }

  development = true

  root_path = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/producer/das_azure_iot_brokers/Azure Event Hub pipeline"
}
