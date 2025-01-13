
data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.video_image_processor.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.video_image_processor.name
}

data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "video_image_processor" {
  name = aws_eks_cluster.video_image_processor.name
}

data "aws_eks_cluster_auth" "video_image_processor" {
  name = aws_eks_cluster.video_image_processor.name
}

data "aws_iam_role" "existing_lambda_role" {
  name = "LabRole"
}