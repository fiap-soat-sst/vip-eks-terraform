resource "aws_dynamodb_table" "vip-dynamodb-table" {
  name         = "vip-video-table"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key     = "email"

  attribute {
    name = "email"
    type = "S"
  }

  tags = {
    Name        = "vip-video-table"
    Environment = "production"
  }
}