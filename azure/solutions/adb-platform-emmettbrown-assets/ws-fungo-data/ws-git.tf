# Creazione delle credenziali Git per il servizio principale
resource "databricks_git_credential" "git" {
  git_provider          = "github"
  git_username          = var.github_usr
  personal_access_token = var.github_tkn
}