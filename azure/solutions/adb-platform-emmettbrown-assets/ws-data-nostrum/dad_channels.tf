resource "databricks_catalog" "dad_channels" {
  metastore_id    = var.metastore_id
  name            = "dad_channels"
  comment         = "dad_channels"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "OPEN"
}

resource "databricks_schema" "traditional_media" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "traditional_media"
  force_destroy = true
}

resource "databricks_schema" "word_of_mouth" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "word_of_mouth"
  force_destroy = true
}

resource "databricks_schema" "digital_and_online" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "digital_and_online"
  force_destroy = true
}

resource "databricks_schema" "physical_and_digital_touchpoints" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "physical_and_digital_touchpoints"
  force_destroy = true
}

resource "databricks_schema" "communication_and_support" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "communication_and_support"
  force_destroy = true
}

resource "databricks_schema" "loyalty_and_engagement" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "loyalty_and_engagement"
  force_destroy = true
}

resource "databricks_schema" "omnichannel_experience" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "omnichannel_experience"
  force_destroy = true
}

resource "databricks_schema" "travels" {
  depends_on    = [databricks_catalog.dad_channels]
  catalog_name  = databricks_catalog.dad_channels.name
  name          = "travels"
  force_destroy = true
}