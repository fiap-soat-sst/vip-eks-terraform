resource "kubernetes_config_map" "config_map_api" {

  metadata {
    name      = "${local.app_short_name}-env"
    namespace = local.namespace
  }

  data = local.config_map_data
}
