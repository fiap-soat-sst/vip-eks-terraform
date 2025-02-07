locals {
  namespace             = "vip-fiap-soat" // não mudar
  application_main_name = "vip-manager-sevice"
  app_short_name        = "vip-mngr"
  app_port              = 3126
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
    image_name    = "evilfeeh/manager-service"
    image_version = "latest" // não mudar
  }

  container_startup_command = ["npm", "run", "start"]


  hpa_replicas = {
    min                               = 1
    max                               = 10
    target_cpu_utilization_percentage = 70
  }

  config_map_data = {
    PORT            = var.PORT
    SWAGGER_URL     = "localhost"
  }


  secrets_data = {
    AWS_REGION      = var.AWS_REGION
    AWS_S3_BUCKET   = var.AWS_S3_BUCKET
    AWS_TABLE_USERS = var.AWS_TABLE_USERS
    AWS_SNS_TOPIC   = var.AWS_SNS_TOPIC
    JWT_SECRET      = var.JWT_SECRET    
    PORT            = 3000
  }
}
