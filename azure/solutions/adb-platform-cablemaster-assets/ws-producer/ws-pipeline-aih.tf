resource "databricks_pipeline" "pipeline_iot_hub_pipeline" {
  depends_on  = [databricks_repo.cablemaster, databricks_secret.scr_iothub_key]

  name       = "IoT Hub pipeline"
  catalog    = "das_azure_iot_brokers"
  schema     = "azure_iothub"
  photon     = true
  serverless = true

  configuration = {
    "iot.ingestion.eh.namespace"                 = "${var.ih_namespace}"
    "iot.ingestion.eh.name"                      = "${var.ih_entityname}"
    "iot.ingestion.eh.accessKeyName"             = "${var.ih_accessKeyName}"
    "io.ingestion.eh.secretsScopeName"           = databricks_secret_scope.ws_scr_scope.name
    "io.ingestion.eh.secretName"                 = databricks_secret.scr_iothub_key.key
    "iot.ingestion.spark.maxOffsetsPerTrigger"   = "50000"
    "iot.ingestion.spark.startingOffsets"        = "latest"
    "iot.ingestion.spark.failOnDataLoss"         = "false"
    "iot.ingestion.kafka.requestTimeout"         = "60000"
    "iot.ingestion.kafka.sessionTimeout"         = "30000"
  }

  # equivalente di libraries.glob.include
  library {
    glob {
      include = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/producer/das_azure_iot_brokers/Azure IoT Hub pipeline/transformations/**"
    }
  }

  # equivalente di root_path
  root_path = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/producer/das_azure_iot_brokers/Azure IoT Hub pipeline"
}
