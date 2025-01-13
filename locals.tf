locals {
  region   = "us-east-1"
  name     = "video-image-processor"
  azs      = ["us-east-1a", "us-east-1b"]
  vpc_cidr = "10.0.0.0/16"
  tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
  }
  role_arn = data.aws_iam_role.existing_lambda_role.arn
  aws_arn  = data.aws_iam_role.existing_lambda_role.arn
}
