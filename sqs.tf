resource "aws_sqs_queue" "vip-upload-to-process-queue" {
  name                        = "uploadToProcessQueue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "vip-process-to-compress-queue" {
  name                        = "processToCompressQueue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}
