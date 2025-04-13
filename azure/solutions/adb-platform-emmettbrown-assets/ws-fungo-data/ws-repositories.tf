resource "databricks_repo" "app_cookbook" {
  url = "https://github.com/pbv0/databricks-apps-cookbook.git"
}

resource "databricks_repo" "delorean" {
  url = "https://github.com/Alegandi83/emmettbrown.git"
}

resource "databricks_repo" "tpc-di" {
  url = "https://github.com/shannon-barrow/databricks-tpc-di.git"
}