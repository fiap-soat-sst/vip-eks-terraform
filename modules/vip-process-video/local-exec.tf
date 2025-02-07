
#this provisioner will subscribe to the LoadBalancer URL to the SNS

resource "aws_sns_topic_subscription" "sns_to_kubernetes" {
  topic_arn = var.sns_topic_arn
  protocol  = "https"
  endpoint  = "https://${kubernetes_service.service_api.status.0.load_balancer.0.ingress.0.hostname}/webhook"
}

resource "null_resource" "subscribe_endpoint" {
  triggers = {
    load_balancer_url = kubernetes_service.service_api.status.0.load_balancer.0.ingress.0.hostname
  }

  provisioner "local-exec" {
    command = <<EOT
      aws sns subscribe \
        --topic-arn ${var.sns_topic_arn} \
        --protocol https \
        --notification-endpoint https://${kubernetes_service.service_api.status.0.load_balancer.0.ingress.0.hostname}/webhook \
        --region ${var.AWS_REGION}
    EOT
  }

  depends_on = [kubernetes_service.service_api, var.sns_topic]
}