locals {
  namespace             = "vip-fiap-soat" // não mudar
  application_main_name = "vip-compress-file"
  app_short_name        = "vip-cmprss"
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
    image_name    = "evilfeeh/vip-compress-file"
    image_version = "latest" // não mudar
  }

  container_startup_command = ["npm", "run", "start"]


  hpa_replicas = {
    min                               = 1
    max                               = 10
    target_cpu_utilization_percentage = 70
  }

  config_map_data = {
    PORT            = var.port
    SWAGGER_URL     = "localhost"
    URL_DEPLOY      = "http://34.95.232.166"
    URL_PAYMENT_API = "https://southamerica-east1-self-service-totem-428818.cloudfunctions.net/payment-fake"
  }


  secrets_data = {
    AWS_REGION = var.AWS_REGION
    AWS_S3_BUCKET_SOURCE     = var.AWS_S3_BUCKET_SOURCE
    AWS_S3_BUCKET_DESTINATION = var.AWS_S3_BUCKET_DESTINATION
    AWS_TABLE_USERS     = var.AWS_TABLE_USERS
    AWS_SNS_TOPIC     = var.AWS_SNS_TOPIC
    PORT = var.PORT
  }
}
