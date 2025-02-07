locals {
  namespace             = "vip-fiap-soat" // não mudar
  application_main_name = "vip-notification"
  app_short_name        = "vip-notif"
  app_port              = 3125
  deployment_resources = {
    limits = {
      cpu    = "2"
      memory = "2Gi"
    }
    requests = {
      cpu    = "300m"
      memory = "128Mi"
    }
  }

  docker = {
    image_name    = "tomasjr/vip-notification"
    image_version = "latest" // não mudar
  }

  container_startup_command = [
    "node", "./dist/src/External/Api/Server.js"
  ]

  hpa_replicas = {
    min                               = 1
    max                               = 10
    target_cpu_utilization_percentage = 70
  }

  config_map_data = {
    PORT            = var.port
  }


  secrets_data = {
    PORT            = 3000
    AWS_REGION      = var.aws_region
    AWS_TABLE_USERS = var.aws_table_users
    EMAIL_HOST      = var.email_host
    EMAIL_PORT      = var.email_port
    EMAIL_USER      = var.email_user
    EMAIL_PASSWORD  = var.email_password
  }
}
