resource "aws_eks_node_group" "vip_node_group" {
  cluster_name    = aws_eks_cluster.video_image_processor.name
  node_group_name = "node-group"
  node_role_arn   = local.aws_arn
  subnet_ids      = module.vpc.private_subnets

  scaling_config {
    desired_size = 1
    max_size     = 10
    min_size     = 1
  }

  instance_types = ["t3.small"]
  capacity_type  = "SPOT"

  tags = local.tags
}
