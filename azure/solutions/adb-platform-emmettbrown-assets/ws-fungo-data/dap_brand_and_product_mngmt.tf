resource "databricks_catalog" "dap_brand_and_product_mngmt" {
  metastore_id    = var.metastore_id
  name            = "dap_brand_and_product_mngmt"
  comment         = "dap brand and product mngmt"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "product_copy_generation" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "product_copy_generation"
  force_destroy = true
}

resource "databricks_schema" "intelligent_product_search" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "intelligent_product_search"
  force_destroy = true
}

resource "databricks_schema" "product_onboarding" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "product_onboarding"
  force_destroy = true
}

resource "databricks_schema" "fuzzy_item_matching" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "fuzzy_item_matching"
  force_destroy = true
}

resource "databricks_schema" "brand_aligned_images" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog_name  = databricks_catalog.dap_brand_and_product_mngmt.name
  name          = "brand_aligned_images"
  force_destroy = true
}

resource "databricks_grants" "dap_brand_and_product_mngmt_grants" {
  depends_on    = [databricks_catalog.dap_brand_and_product_mngmt]
  catalog = "dap_brand_and_product_mngmt"
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
      "USE_CATALOG"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-brand-${var.deploy_ver}"
    privileges = [
      "ALL_PRIVILEGES",
      "MANAGE"
    ]
  }
  grant {
    principal = "grp-${var.deploy_id}-${var.deploy_env}-${var.component_name}-talent-${var.deploy_ver}"
    privileges = [
      "USE_CATALOG"
    ]
  }
}