resource "databricks_database_instance" "this" {
  name = "fungo-data-lakebase"
  capacity = "CU_2"
}