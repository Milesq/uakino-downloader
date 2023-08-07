output "params" {
  value = tomap({
    "CLUSTER_NAME" = aws_ecs_cluster.uakino_downloader_cluster.arn
    "TASK_DEF_NAME" = aws_ecs_task_definition.my_task_definition.family
    "SUBNET" = aws_subnet.public_subnet.id
  })
}
