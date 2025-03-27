resource "databricks_catalog" "das_product_development" {
  metastore_id    = var.metastore_id
  name            = "das_product_development"
  comment         = "das product development"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "cad_computer_aided_design" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "cad_computer_aided_design"
  force_destroy = true
}

resource "databricks_schema" "cae_computer_aided_engineering" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "cae_computer_aided_engineering"
  force_destroy = true
}

resource "databricks_schema" "plm_product_lifecycle_management" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "plm_product_lifecycle_management"
  force_destroy = true
}

resource "databricks_schema" "pdm_product_data_management" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "pdm_product_data_management"
  force_destroy = true
}

resource "databricks_schema" "scr_agile_e_scrum_tools" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "scr_agile_e_scrum_tools"
  force_destroy = true
}

resource "databricks_schema" "kms_knowledge_management_systems" {
  depends_on    = [databricks_catalog.das_product_development]
  catalog_name  = databricks_catalog.das_product_development.name
  name          = "kms_knowledge_management_systems"
  force_destroy = true
}