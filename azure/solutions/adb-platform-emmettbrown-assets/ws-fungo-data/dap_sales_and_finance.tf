resource "databricks_catalog" "dap_sales_and_finance" {
  metastore_id    = var.metastore_id
  name            = "dap_sales_and_finance"
  comment         = "dap_sales_and_finance"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "finance_portoflio_assistant" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "finance_portoflio_assistant"
  force_destroy = true
}

resource "databricks_schema" "sales_forecasting_and_attribution" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "sales_forecasting_and_attribution"
  force_destroy = true
}

resource "databricks_schema" "sales_pipeline_review" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "sales_pipeline_review"
  force_destroy = true
}

resource "databricks_schema" "sales_inventory_analysis" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog_name  = databricks_catalog.dap_sales_and_finance.name
  name          = "sales_inventory_analysis"
  force_destroy = true
}

resource "databricks_grants" "dap_sales_and_finance_grants" {
  depends_on    = [databricks_catalog.dap_sales_and_finance]
  catalog = "dap_sales_and_finance"
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-quality-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-service-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-marketing-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-supplychain-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-sales-${var.deploy_ver}"
    privileges = [
      "ALL_PRIVILEGES",
      "MANAGE"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-digital-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-manufacturing-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-legal-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-brand-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-talent-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
}