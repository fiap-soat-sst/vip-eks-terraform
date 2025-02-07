resource "kubernetes_secret" "secrets_api" {
  metadata {
    name      = "${local.app_short_name}-secrets"
    namespace = local.namespace
  }

  data = local.secrets_data

  type = "Opaque"
}
