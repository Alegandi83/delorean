data "databricks_spark_version" "latest" {}
data "databricks_node_type" "smallest" {
  local_disk = true
}


resource "databricks_job" "this" {
  depends_on  = [databricks_repo.cablemaster]
  name        = "Cablemaster Consumer Setup"
  description = "This Job executes the Cablemaster Consumer setup tasks."

/*
  job_cluster {
    job_cluster_key = "j"
    new_cluster {
      num_workers   = 1
      spark_version = data.databricks_spark_version.latest.id
      node_type_id  = data.databricks_node_type.smallest.id
    }
  }
*/
  task {
    task_key = "Create_Tables"

/*
    new_cluster {
      num_workers   = 1
      spark_version = data.databricks_spark_version.latest.id
      node_type_id  = data.databricks_node_type.smallest.id
    }
*/
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/consumer/dap_cablemaster/00 - cablemaster create"
    }
  }

  task {
    task_key = "Insert_Tables"
   depends_on {
      task_key = "Create_Tables"
    }
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/cablemaster.git/consumer/dap_cablemaster/01 - cablemaster populate"
    }
  }

  
/*
  task {
    task_key = "b"
    //this task will only run after task a
    depends_on {
      task_key = "a"
    }

    existing_cluster_id = databricks_cluster.shared.id

    spark_jar_task {
      main_class_name = "com.acme.data.Main"
    }
  }

  task {
    task_key = "c"

    job_cluster_key = "j"

    notebook_task {
      notebook_path = databricks_notebook.this.path
    }
  }
  //this task starts a Delta Live Tables pipline update
  task {
    task_key = "d"

    pipeline_task {
      pipeline_id = databricks_pipeline.this.id
    }
  }
  */
}