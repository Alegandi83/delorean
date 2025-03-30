resource "databricks_catalog" "das_operational_technologies" {
  metastore_id    = var.metastore_id
  name            = "das_operational_technologies"
  comment         = "das operational technologies"
  storage_root    = var.adls_path 
  force_destroy   = true
  isolation_mode  = "ISOLATED"
}

resource "databricks_schema" "plc_programmable_logic_ontrollers" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "plc_programmable_logic_ontrollers"
  force_destroy = true
}

resource "databricks_schema" "scada_supervisory_control_and_data_acquisition" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "scada_supervisory_control_and_data_acquisition"
  force_destroy = true
}

resource "databricks_schema" "dcs_distribuited_control_systems" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "dcs_distribuited_control_systems"
  force_destroy = true
}

resource "databricks_schema" "hmi_human_machine_interfaces" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "hmi_human_machine_interfaces"
  force_destroy = true
}

resource "databricks_schema" "rtu_remote_terminal_units" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "rtu_remote_terminal_units"
  force_destroy = true
}

resource "databricks_schema" "cnc_computer_numerical_control_systems" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "cnc_computer_numerical_control_systems"
  force_destroy = true
}

resource "databricks_schema" "bas_bulding_automation_systems" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "bas_bulding_automation_systems"
  force_destroy = true
}

resource "databricks_schema" "oem_original_equipment_manufacturer" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "oem_original_equipment_manufacturer"
  force_destroy = true
}

resource "databricks_schema" "hst_historians" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "hst_historians"
  force_destroy = true
}

resource "databricks_schema" "iiot_industrial_internet_of_things" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "iiot_industrial_internet_of_things"
  force_destroy = true
}

resource "databricks_schema" "sm_smart_meters" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "sm_smart_meters"
  force_destroy = true
}

resource "databricks_schema" "sns_sensors" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "sns_sensors"
  force_destroy = true
}

resource "databricks_schema" "act_actuators" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "act_actuators"
  force_destroy = true
}

resource "databricks_schema" "vfd_variable_frequency_drive" {
  depends_on    = [databricks_catalog.das_operational_technologies]
  catalog_name  = databricks_catalog.das_operational_technologies.name
  name          = "vfd_variable_frequency_drive"
  force_destroy = true
}