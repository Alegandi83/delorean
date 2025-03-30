# plc_programmable_logic_ontrollers
resource "databricks_share" "plc_programmable_logic_ontrollers" {
  depends_on = [ databricks_schema.plc_programmable_logic_ontrollers ]
  name = "plc_programmable_logic_ontrollers"
  object {
    name                        = "das_operational_technologies.plc_programmable_logic_ontrollers"
    data_object_type            = "SCHEMA"
    history_data_sharing_status = "ENABLED"
  }
}

resource "databricks_grants" "plc_programmable_logic_ontrollers_grants" {
  depends_on = [ databricks_schema.plc_programmable_logic_ontrollers ]
  share = databricks_share.plc_programmable_logic_ontrollers.name
  grant {
    principal  = databricks_recipient.cablemaster2emmettbrown.name
    privileges = ["SELECT"]
  }
}

# scada_supervisory_control_and_data_acquisition
resource "databricks_share" "scada_supervisory_control_and_data_acquisition" {
  depends_on = [ databricks_schema.scada_supervisory_control_and_data_acquisition ]
  name = "scada_supervisory_control_and_data_acquisition"
  object {
    name                        = "das_operational_technologies.scada_supervisory_control_and_data_acquisition"
    data_object_type            = "SCHEMA"
    history_data_sharing_status = "ENABLED"
  }
}

resource "databricks_grants" "scada_supervisory_control_and_data_acquisition_grants" {
  depends_on = [ databricks_schema.scada_supervisory_control_and_data_acquisition ]
  share = databricks_share.scada_supervisory_control_and_data_acquisition.name
  grant {
    principal  = databricks_recipient.cablemaster2emmettbrown.name
    privileges = ["SELECT"]
  }
}

# dcs_distribuited_control_systems
resource "databricks_share" "dcs_distribuited_control_systems" {
  depends_on = [ databricks_schema.dcs_distribuited_control_systems ]
  name = "dcs_distribuited_control_systems"
  object {
    name                        = "das_operational_technologies.dcs_distribuited_control_systems"
    data_object_type            = "SCHEMA"
    history_data_sharing_status = "ENABLED"
  }
}

resource "databricks_grants" "dcs_distribuited_control_systems" {
  depends_on = [ databricks_schema.dcs_distribuited_control_systems ]
  share = databricks_share.dcs_distribuited_control_systems.name
  grant {
    principal  = databricks_recipient.cablemaster2emmettbrown.name
    privileges = ["SELECT"]
  }
}

# hmi_human_machine_interfaces
resource "databricks_share" "hmi_human_machine_interfaces" {
  depends_on = [ databricks_schema.hmi_human_machine_interfaces ]
  name = "hmi_human_machine_interfaces"
  object {
    name                        = "das_operational_technologies.hmi_human_machine_interfaces"
    data_object_type            = "SCHEMA"
    history_data_sharing_status = "ENABLED"
  }
}

resource "databricks_grants" "hmi_human_machine_interfaces" {
  depends_on = [ databricks_schema.hmi_human_machine_interfaces ]
  share = databricks_share.hmi_human_machine_interfaces.name
  grant {
    principal  = databricks_recipient.cablemaster2emmettbrown.name
    privileges = ["SELECT"]
  }
}