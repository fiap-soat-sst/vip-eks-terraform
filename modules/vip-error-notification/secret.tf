resource "kubernetes_secret" "secrets_api" {
  metadata {
    name      = "${local.app_short_name}-secrets"
    namespace = local.namespace
  }

  data = {
    DB_DATABASE = var.db_database
    DB_HOST     = var.db_host
    DB_PASSWORD = var.db_password
    DB_PORT     = 3306
    DB_TYPE     = var.db_type
    DB_USERNAME = var.db_username
    PORT        = 3000
  }

  type = "Opaque"
}
