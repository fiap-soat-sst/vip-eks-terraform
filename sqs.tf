resource "aws_sqs_queue" "vip_upload_to_process_queue" {
  name                        = "uploadToProcessQueue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "vip_process_to_compress_queue" {
  name                        = "processToCompressQueue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}
