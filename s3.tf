resource "aws_s3_bucket" "video_bucket" {
  bucket = "vip-soat-videos-bucket"

  tags = {
    Name        = "video bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket" "grouped_images_bucket" {
  bucket = "vip-soat-grouped-images-bucket"

  tags = {
    Name        = "grouped images bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket" "compacted_image_bucket" {
  bucket = "vip-soat-compacted-image-bucket"

  tags = {
    Name        = "compacted images bucket"
    Environment = "Production"
  }
}