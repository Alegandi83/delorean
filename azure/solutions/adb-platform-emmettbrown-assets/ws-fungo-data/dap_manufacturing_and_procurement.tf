resource "databricks_catalog" "dap_manufacturing_and_procurement" {
  metastore_id    = var.metastore_id
  name            = "dap_manufacturing_and_procurement"
  comment         = "ddap_manufacturing_and_procurement"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "digital_twin" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.dap_manufacturing_and_procurement.name
  name          = "digital_twin"
  force_destroy = true
}

resource "databricks_schema" "predictive_maintenance" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.dap_manufacturing_and_procurement.name
  name          = "predictive_maintenance"
  force_destroy = true
}

resource "databricks_schema" "iot_timeseries_analysis" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.dap_manufacturing_and_procurement.name
  name          = "iot_timeseries_analysis"
  force_destroy = true
}

resource "databricks_schema" "anomaly_detection" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.dap_manufacturing_and_procurement.name
  name          = "anomaly_detection"
  force_destroy = true
}

resource "databricks_schema" "equipment_effectiveness" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.dap_manufacturing_and_procurement.name
  name          = "equipment_effectiveness"
  force_destroy = true
}

resource "databricks_schema" "esg_performance_analytics" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog_name  = databricks_catalog.dap_manufacturing_and_procurement.name
  name          = "esg_performance_analytics"
  force_destroy = true
}

resource "databricks_grants" "dap_manufacturing_and_procurement_grants" {
  depends_on    = [databricks_catalog.dap_manufacturing_and_procurement]
  catalog = "dap_manufacturing_and_procurement"
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
      "ALL_PRIVILEGES",
      "MANAGE"
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