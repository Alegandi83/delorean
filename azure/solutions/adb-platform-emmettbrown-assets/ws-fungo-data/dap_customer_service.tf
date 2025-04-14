resource "databricks_catalog" "dap_customer_service" {
  metastore_id    = var.metastore_id
  name            = "dap_customer_service"
  comment         = "dap_customer_service"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "field_service_assistant" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "field_service_assistant"
  force_destroy = true
}

resource "databricks_schema" "customer_service_analytics" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "customer_service_analytics"
  force_destroy = true
}

resource "databricks_schema" "product_warranty_optimization" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "product_warranty_optimization"
  force_destroy = true
}

resource "databricks_schema" "customer_service_agent" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog_name  = databricks_catalog.dap_customer_service.name
  name          = "customer_service_agent"
  force_destroy = true
}

resource "databricks_grants" "dap_customer_service_grants" {
  depends_on    = [databricks_catalog.dap_customer_service]
  catalog = "dap_customer_service"
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-quality-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-service-${var.deploy_ver}"
    privileges = [
      "ALL_PRIVILEGES",
      "MANAGE"
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
      "USE_CATALOG"
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