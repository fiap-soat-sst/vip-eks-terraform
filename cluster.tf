resource "aws_eks_cluster" "video_image_processor" {
  name     = local.name
  role_arn = local.aws_arn

  vpc_config {
    subnet_ids              = module.vpc.private_subnets
    endpoint_private_access = true
  }

  tags = local.tags
}
