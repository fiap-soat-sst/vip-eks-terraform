resource "kubernetes_secret" "secrets_api" {
  metadata {
    name      = "${local.app_short_name}-secrets"
    namespace = local.namespace
  }

  data = {
    PORT            = 3000
    AWS_REGION      = var.aws_region
    AWS_TABLE_USERS = var.aws_table_users
    EMAIL_HOST      = var.email_host
    EMAIL_PORT      = var.email_port
    EMAIL_USER      = var.email_user
    EMAIL_PASSWORD  = var.email_password
  }

  type = "Opaque"
}
