resource "databricks_catalog" "dap_supplychain_and_logistics" {
  metastore_id    = var.metastore_id
  name            = "dap_supplychain_and_logistics"
  comment         = "dap_supplychain_and_logistics"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "supply_chain_optimization" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "supply_chain_optimization"
  force_destroy = true
}

resource "databricks_schema" "demand_forecasting" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "demand_forecasting"
  force_destroy = true
}

resource "databricks_schema" "generative_forecasting" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "generative_forecasting"
  force_destroy = true
}

resource "databricks_schema" "safety_stock" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "safety_stock"
  force_destroy = true
}

resource "databricks_schema" "order_picking_optimization" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "order_picking_optimization"
  force_destroy = true
}

resource "databricks_schema" "stock_keeping_unit_analytics" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "stock_keeping_unit_analytics"
  force_destroy = true
}

resource "databricks_schema" "on_shelf_availability" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "on_shelf_availability"
  force_destroy = true
}

resource "databricks_schema" "barcode_traceability_recalls" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "barcode_traceability_recalls"
  force_destroy = true
}

resource "databricks_schema" "scalable_route_generation" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog_name  = databricks_catalog.dap_supplychain_and_logistics.name
  name          = "scalable_route_generation"
  force_destroy = true
}

resource "databricks_grants" "dap_supplychain_and_logistics_grants" {
  depends_on    = [databricks_catalog.dap_supplychain_and_logistics]
  catalog = "dap_supplychain_and_logistics"
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
      "ALL_PRIVILEGES",
      "MANAGE"
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