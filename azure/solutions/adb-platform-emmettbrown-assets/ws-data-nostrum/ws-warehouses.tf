resource "databricks_sql_endpoint" "sql_dwh" {
  name             = "Data Nostrum SQL Endpoint"
  cluster_size     = "Small"
  min_num_clusters = 1
  max_num_clusters = 3
  auto_stop_mins   = 30
  enable_serverless_compute = true 

  tags {
    custom_tags {
      key   = "company"
      value = "emmettbrown"
    }
  }
}