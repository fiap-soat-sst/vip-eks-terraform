resource "aws_dynamodb_table" "vip-dynamodb-table" {
  name         = "vip-video-table"
  billing_mode = "PROVISIONED"
  hash_key     = "UserId"
  range_key    = "videoname"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "Username"
    type = "S"
  }

  attribute {
    name = "videoname"
    type = "S"
  }

  attribute {
    name = "bucketUrl"
    type = "S"
  }

  tags = {
    Name        = "vip-video-table"
    Environment = "production"
  }
}