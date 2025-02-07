
#this provisioner will subscribe to the LoadBalancer URL to the SNS
resource "null_resource" "subscribe_endpoint" {
  triggers = {
    # Re-run this provisioner if the LoadBalancer URL changes
    load_balancer_url = kubernetes_service.mking_api.status.0.load_balancer.0.ingress.0.hostname
  }

  provisioner "local-exec" {
    command = <<EOT
      aws sns subscribe \
        --topic-arn ${aws_sns_topic.my_https_topic.arn} \
        --protocol https \
        --notification-endpoint https://${kubernetes_service.mking_api.status.0.load_balancer.0.ingress.0.hostname}/webhook \
        --region ${var.AWS_REGION}
    EOT
  }

  depends_on = [kubernetes_service.service_api, aws_sns_topic.vip_manager_to_process]
}