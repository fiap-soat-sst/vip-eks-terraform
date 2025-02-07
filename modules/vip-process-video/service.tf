resource "kubernetes_service" "service_api" {
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

output "load_balancer_url" {
  description = "The external URL of the LoadBalancer"
  value       = kubernetes_service.service_api.status.0.load_balancer.0.ingress.0.hostname
}