
variable "deploy_id" {
  type        = string
  description = "(Required) The global unique identifier for the owner of deployment: e.g. ag83"
}

variable "deploy_env" {
  type        = string
  description = "(Required) The environment for the deployment: e.g. tf"
}

variable "deploy_prj" {
  type        = string
  description = "(Required) The prject name for the deployment: e.g. test"
}

variable "deploy_ver" {
  type        = string
  description = "(Required) The version for the deployment: e.g. 001"
}

variable "component_name" {
  type        = string
  description = "(Required) The component name of the deployment: producer"
}

variable "metastore_id" {
  type        = string
  description = "the id of the metastore"
}

variable "workspace_url" {
  type        = string
  description = "the url of the workspace"
}

variable "budget_policy_id" {
  type        = string
  description = "the id of the workspace budget policy"
}

variable "adls_path" {
  type        = string
  description = "The ADLS path of the workspace storage external location"
}

variable "github_usr" {
  type        = string
  description = "Github user to link databricks workspace to github"
  sensitive   = true
  default     = null
}
variable "github_tkn" {
  type        = string
  description = "Github token to link databricks workspace to github"
  sensitive   = true
  default     = null
}

variable "dbw_federated_url" {
  type        = string
  description = "url of the federated workspace. Used for lakehouse federation on databricks source"
}

variable "dbw_federated_sql_http_path" {
  type        = string
  description = "sql id of the federated workspace. Used for lakehouse federation on databricks source"
}

variable "dbw_federated_pat" {
  type        = string
  description = "user pat of the federated workspace. Used for lakehouse federation on databricks source"
}

variable "recipient_id" {
  type        = string
  description = "Global ID of the recipient Metastore. Used for delta sharing"
}

variable "recipient_name" {
  type        = string
  description = "Name of the recipient. Used for delta sharing"
}

variable "sql_server_host" {
  type        = string
  description = "The host of the SQL logical server."
}

variable "sql_database_name" {
  type        = string
  description = "The host of the SQL logical server."
}

variable "postgresql_server_name" {
  type        = string
  description = "The host of the postresql server."
}

variable "postgresql_database_name" {
  type        = string
  description = "The host of the postresql database."
}

variable "sql_admin_usr" {
  type        = string
  description = "The administrator username of the SQL logical server."
}

variable "sql_admin_psw" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
}
variable "eh_namespace" {
  type        = string
  description = "Event Hub namespece to use in event hub ingestion pipelin"
}
variable "eh_entityname" {
  type        = string
  description = "Event Hub entity name to use in event hub ingestion pipelin"
}

variable "eh_accessKeyName" {
  type        = string
  description = "Event Hub accessKeyName to use in event hub ingestion pipelin"
}

variable "eh_accessKeyValue" {
  type        = string
  sensitive   = true
  description = "Event Hub accessKeyValue to use in event hub ingestion pipelin"
}

variable "ih_namespace" {
  type        = string
  description = "Iot Hub namespece to use in event hub ingestion pipelin"
}
variable "ih_entityname" {
  type        = string
  description = "Iot Hub entity name to use in event hub ingestion pipelin"
}

variable "ih_accessKeyName" {
  type        = string
  description = "Iot Hub accessKeyName to use in event hub ingestion pipelin"
}

variable "ih_accessKeyValue" {
  type        = string
  sensitive   = true
  description = "Iot Hub accessKeyValue to use in event hub ingestion pipelin"
}
/*
variable "ih_event_hub_events_endpoint" {
  type        = string
  sensitive   = true
  description = "IoT Hub event endpoint to use in iot hub ingestion pipeline"
}
variable "ih_service_connection_string" {
  type        = string
  sensitive   = true
  description = "IoT Hub service connection string to use in iot hub ingestion pipeline"
}
*/