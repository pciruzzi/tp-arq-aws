resource "aws_elasticache_replication_group" "redis" {
  availability_zones            = ["${var.availability_zone}"]
  replication_group_id          = "redis-arquitecturas"
  replication_group_description = "Redis para TP de Arquitecturas"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = 1
  engine                        = "redis"
  engine_version                = "4.0.10"
  parameter_group_name          = "default.redis4.0"
  port                          = 6379
  security_group_ids            = ["${aws_security_group.apps.id}"]

  # Store the resulting dns
  provisioner "local-exec" {
    command = "echo ${aws_elasticache_replication_group.redis.primary_endpoint_address} > node/redis_dns"
  }

  # Use the redis host in node code
  provisioner "local-exec" {
    command = "sed -E \"s/(host:)[^,]*,/\\1 '$(cat node/redis_dns)',/\" node/config.js > node/temp.js && mv node/temp.js node/config.js"
  }
}