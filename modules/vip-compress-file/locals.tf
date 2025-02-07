locals {
  namespace             = "vip-fiap-soat" // não mudar
  application_main_name = "vip-compress-file"
  app_short_name        = "vip-cmprss"
  app_port              = 3127
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

  container_startup_command = ["npm", "start"]

  hpa_replicas = {
    min                               = 1
    max                               = 10
    target_cpu_utilization_percentage = 70
  }

  config_map_data = {
    PORT = local.app_port
    AWS_DYNAMO_DATABASE="vip-video-table"
    AWS_RAW_IMAGES_BUCKET="vip-soat-grouped-images-bucket"
    AWS_ZIP_IMAGES_BUCKET="vip-soat-compacted-image-bucket"
    SQS_REDIS_URL="redis://vip-redis-cluster.vkfqh8.0001.use1.cache.amazonaws.com:6379"
    AWS_PROCESS_TO_COMPRESS_QUEUE="https://sqs.us-east-1.amazonaws.com/295258281009/processToCompressQueue.fifo"
  }

  secrets_data = {
    AWS_ACCESS_KEY_ID=var.AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY=var.AWS_SECRET_ACCESS_KEY
    AWS_SESSION_TOKEN=var.AWS_SESSION_TOKEN
    AWS_REGION="us-east-1"
  }
}
