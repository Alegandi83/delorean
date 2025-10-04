resource "databricks_budget" "this" {
  
  depends_on = [ databricks_mws_permission_assignment.this ]
  provider = databricks.account
  display_name = "bdg-${var.deploy_id}-${var.deploy_env}-${var.component_name}-${var.deploy_ver}"

  alert_configurations {
    time_period        = "MONTH"
    trigger_type       = "CUMULATIVE_SPENDING_EXCEEDED"
    quantity_type      = "LIST_PRICE_DOLLARS_USD"
    quantity_threshold = "1000"

    action_configurations {
      action_type = "EMAIL_NOTIFICATION"
      target      = join(",", var.metastore_admins)
    }
  }

  filter {
    workspace_id {
      operator = "IN"
      values = [
        var.workspace_id
      ]
    }

    tags {
      key = "env"
      value {
        operator = "IN"
        values   = ["${var.deploy_env}"]
      }
    }

    tags {
      key = "component"
      value {
        operator = "IN"
        values   = ["${var.component_name}"]
      }
    }
  }
}