resource "aws_sqs_queue" "vip-upload-to-process-queue" {
  name                        = "upload-to-process-queue"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "vip-process-to-compress-queue" {
  name                        = "process-to-compress-queue"
  fifo_queue                  = true
  content_based_deduplication = true
}
