resource "databricks_catalog" "dap_legal_and_compliance" {
  metastore_id    = var.metastore_id
  name            = "dap_legal_and_compliance"
  comment         = "dap_legal_and_compliance"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "legal_and_compliance" {
  depends_on    = [databricks_catalog.dap_legal_and_compliance]
  catalog_name  = databricks_catalog.dap_legal_and_compliance.name
  name          = "legal_and_compliance"
  force_destroy = true
}

resource "databricks_grants" "dap_legal_and_compliance_grants" {
  depends_on    = [databricks_catalog.dap_legal_and_compliance]
  catalog = "dap_legal_and_compliance"
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
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-legal-${var.deploy_ver}"
    privileges = [
      "ALL_PRIVILEGES",
      "MANAGE"
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