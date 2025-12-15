output "platform_metastore_id" {
  description = "ID of the created Metastore"
  value       = module.adb-lakehouse-uc-metastore.metastore_id
}

output "platform_global_metastore_id" {
  description = "Global ID of the created Metastore. Used for delta sharing"
  value       = module.adb-lakehouse-uc-metastore.global_metastore_id
}

output "producer_azure_resource_group_id" {
  description = "ID of the created Azure resource group"
  value       = module.adb-lakehouse-producer.azure_resource_group_id
}

output "producer_workspace_id" {
  description = "The Databricks workspace ID"
  value       = module.adb-lakehouse-producer.workspace_id
}

output "producer_workspace_url" {
  description = "The Databricks workspace URL"
  value       = module.adb-lakehouse-producer.workspace_url
}

output "producer_budget_policy_id" {
  description = "The Budget Policy ID"
  value       = module.adb-lakehouse-uc-idf-assignment-producer.budget_policy_id
}


output "producer_storage_url" {
  description = "The Databricks producer storage URL"
  value       = module.adb-lakehouse-producer-workspace-assets.adls_path
}


output "consumer_azure_resource_group_id" {
  description = "ID of the created Azure resource group"
  value       = module.adb-lakehouse-consumer.azure_resource_group_id
}

output "consumer_workspace_id" {
  description = "The Databricks workspace ID"
  value       = module.adb-lakehouse-consumer.workspace_id
}

output "consumer_workspace_url" {
  description = "The Databricks workspace URL"
  value       = module.adb-lakehouse-consumer.workspace_url
}

output "consumer_budget_policy_id" {
  description = "The Budget Policy ID"
  value       = module.adb-lakehouse-uc-idf-assignment-consumer.budget_policy_id
}


output "consumer_storage_url" {
  description = "The Databricks consumer storage URL"
  value       = module.adb-lakehouse-consumer-workspace-assets.adls_path
}

output "producer_user_pat" {
  value       = module.adb-lakehouse-uc-idf-assignment-producer.user_pat
  description = "The user PAT token"
}

output "consumer_user_pat" {
  value       = module.adb-lakehouse-uc-idf-assignment-consumer.user_pat
  description = "The user PAT token"
}
