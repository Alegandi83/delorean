output "sql_http_path" {
  description = "The SQL Endpoint ID"
  value       = databricks_sql_endpoint.sql_dwh.odbc_params[0].path
}

output "sql_endpoint_jdbc_url" {
  description = "The SQL Endpoint ID"
  value       = databricks_sql_endpoint.sql_dwh.jdbc_url
}