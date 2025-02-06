resource "kubernetes_service" "mking_api" {
  metadata {
    name      = "${local.app_short_name}-service"
    namespace = local.namespace

    labels = {
      app      = local.application_main_name
      resource = "service"
    }
  }

  spec {
    selector = {
      app = "${local.app_short_name}-service"
    }

    type = "LoadBalancer"

    port {
      name        = "${local.app_short_name}-service"
      port        = 80
      target_port = local.app_port
      protocol    = "TCP"
    }
  }

  depends_on = [kubernetes_deployment.deployment_api]
}
