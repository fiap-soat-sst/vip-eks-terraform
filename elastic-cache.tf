resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "vip-redis-cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis4.0"
  engine_version       = "4.0.10"
  port                 = 6379
}

output "redis_url" {
  value = aws_elasticache_cluster.redis.cache_nodes.0.address
}