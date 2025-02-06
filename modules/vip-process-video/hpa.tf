resource "kubernetes_horizontal_pod_autoscaler" "hpa_api" {
  metadata {
    name      = "${local.app_short_name}-hpa"
    namespace = local.namespace
  }

  spec {
    max_replicas = local.hpa_replicas.max
    min_replicas = local.hpa_replicas.min

    target_cpu_utilization_percentage = local.hpa_replicas.target_cpu_utilization_percentage

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.deployment_api.metadata[0].name
    }
  }

}
