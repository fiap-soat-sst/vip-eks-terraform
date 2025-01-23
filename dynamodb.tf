resource "aws_dynamodb_table" "vip-dynamodb-table" {
  name         = "vip-video-table"
  billing_mode = "PROVISIONED"
  hash_key     = "UserId"
  range_key    = "videoname"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "videoname"
    type = "S"
  }

  tags = {
    Name        = "vip-video-table"
    Environment = "production"
  }
}