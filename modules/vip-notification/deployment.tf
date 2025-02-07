resource "kubernetes_deployment" "deployment_api" {

  depends_on = [kubernetes_config_map.mking_env, kubernetes_secret.mking_api_secrets]

  metadata {
    name      = local.application_main_name
    namespace = local.namespace
    labels = {
      app = local.application_main_name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.application_main_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.application_main_name
        }
      }

      spec {
        container {
          name  = local.application_main_name
          image = "${local.docker.image_name}:${local.docker.image_version}"

          env_from {
            secret_ref {
              name = "${local.application_main_name}-secrets"
            }
          }

          env_from {
            config_map_ref {
              name = "${local.app_short_name}-env"
            }
          }

          port {
            container_port = local.app_port
          }

          resources {
            limits = {
              cpu    = local.deployment_resources.limits.cpu
              memory = local.deployment_resources.limits.memory
            }

            requests = {
              cpu    = local.deployment_resources.requests.cpu
              memory = local.deployment_resources.requests.memory
            }
          }
        }

        init_container {
          name  = "migrate"
          image = "${local.docker.image_name}:${local.docker.image_version}"

          command = local.container_startup_command

          env_from {
            secret_ref {
              name = "${local.application_main_name}-secrets"
            }
          }

          env_from {
            config_map_ref {
              name = "${local.app_short_name}-env"
            }
          }
        }
      }
    }
  }
}
