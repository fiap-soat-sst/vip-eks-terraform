resource "aws_sns_topic" "vip_video_to_image_processor" {
  name = "VipVideoToImageProcessor"
}

resource "aws_sns_topic_subscription" "process-to-image-subscription" {
  topic_arn = aws_sns_topic.vip_video_to_image_processor.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.vip_process_to_compress_queue.arn
}

resource "aws_sqs_queue_policy" "my_queue_policy" {
  queue_url = aws_sqs_queue.vip_process_to_compress_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "SNSToSQSPolicy"
    Statement = [
      {
        Sid       = "Allow-SNS-SendMessage"
        Effect    = "Allow"
        Principal = "*"
        Action    = "sqs:SendMessage"
        Resource  = aws_sqs_queue.vip_process_to_compress_queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.vip_video_to_image_processor.arn
          }
        }
      }
    ]
  })
}