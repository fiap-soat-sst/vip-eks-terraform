resource "aws_s3_bucket" "video_bucket" {
  bucket = "vip-video-bucket"

  tags = {
    Name        = "video bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket" "image_bucket" {
  bucket = "vip-image-bucket"

  tags = {
    Name        = "images bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket" "compacted_image_bucket" {
  bucket = "vip-compacted-image-bucket"

  tags = {
    Name        = "compacted images bucket"
    Environment = "Production"
  }
}