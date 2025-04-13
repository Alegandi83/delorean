data "databricks_spark_version" "latest" {}
data "databricks_node_type" "smallest" {
  local_disk = true
}


resource "databricks_job" "this" {
  depends_on  = [databricks_repo.cablemaster]
  name        = "00 - Cablemaster Producer Setup"
  description = "This Job executes the Cablemaster Producer setup tasks."

  task {
    task_key = "Install_DBDemos"

    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/producer/platform/dbdemos"
    }
  }

}