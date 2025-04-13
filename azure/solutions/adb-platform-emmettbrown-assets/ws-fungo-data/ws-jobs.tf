resource "databricks_job" "this" {
  depends_on  = [databricks_repo.delorean]
  name        = "00 - EmmettBrown FunGo Data Setup"
  description = "This Job executes the EmmettBrown FunGo Data setup tasks."

  task {
    task_key = "Marketing_Advertising-Customer_Churn_Analytics"

    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_marketing_and_advertising/customer_churn_analytics/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Marketing_Advertising-Campaign_Optimization"
   depends_on {
      task_key = "Marketing_Advertising-Customer_Churn_Analytics"
    }
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_marketing_and_advertising/marketing_campaign_optimization/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Sales_Finance-Finance_Portfolio_Assistant"

    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_sales_and_finance/finance_portoflio_assistant/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Sales_Finance-Sales_Pipelines_Review"
   depends_on {
      task_key = "Sales_Finance-Finance_Portfolio_Assistant"
    }
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_sales_and_finance/finance_portoflio_assistant/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Quality-Product_Quality_Inspection"
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_quality/product_quality_inspection/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Supply_Chain-Demand_Forecasting"

    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_supplychain_and_logistics/demand_forecasting/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Customer_Service-Field_Service_Assistant"

    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_customer_service/field_service_assistant/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Customer_Service-Customer_Support"
   depends_on {
      task_key = "Customer_Service-Field_Service_Assistant"
    }
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_customer_service/customer_service_analytics/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

  task {
    task_key = "Customer_Service-Customer_Service_Agent"
   depends_on {
      task_key = "Customer_Service-Customer_Support"
    }
    notebook_task {
      notebook_path = "/Workspace/Users/alessandro.gandini@databricks.com/emmettbrown.git/fungo_data/dap_customer_service/customer_service_agent/setup"
      base_parameters = {
        "par_cloud"         = "AZURE"
        "par_workspace_url" = var.workspace_url
      }
    }
  }

}