resource "databricks_app" "this" {
  
  depends_on  = [ databricks_sql_endpoint.sql_dwh ]
  name        = "fungo-data-app"
  description = "Data App to deploy your content"

  resources = [{
    name = "sql-warehouse"
    sql_warehouse = {
      id         = databricks_sql_endpoint.sql_dwh.id
      permission = "CAN_MANAGE"
    }
    },
    {
      name = "serving-endpoint"
      serving_endpoint = {
        name       = "databricks-meta-llama-3-3-70b-instruct"
        permission = "CAN_QUERY"
      }
    }]
}