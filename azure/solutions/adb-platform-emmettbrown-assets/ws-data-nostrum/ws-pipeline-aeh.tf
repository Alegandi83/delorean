resource "databricks_pipeline" "pipeline_event_hub_pipeline" {
  depends_on  = [databricks_repo.delorean, databricks_secret.scr_eventhub_key]

  name       = "Event Hub pipeline"
  catalog    = "dad_open_data"
  schema     = "news"
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
      include = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/data_nostrum/dad_open_data/news/Azure Event Hub pipeline/transformations/**"
    }
  }

  development = true

  root_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/data_nostrum/dad_open_data/news/Azure Event Hub pipeline"
}
