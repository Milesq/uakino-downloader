resource "aws_ecs_cluster" "uakino_downloader_cluster" {
  name = "uakino-downloader-cluster"
}

resource "aws_ecs_task_definition" "my_task_definition" {
  family = "uakino-downloader"

  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([{
    name  = "main"
    image = aws_ecr_repository.container_repo.repository_url

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "uakino"
        "awslogs-region"        = "eu-central-1"
        "awslogs-stream-prefix" = "my-stream-prefix"
      }
    }
  }])
}

# resource "aws_ecs_service" "my_service" {
#   name            = "my-ecs-service"
#   cluster         = aws_ecs_cluster.aws_ecs_cluster.id
#   task_definition = aws_ecs_task_definition.my_task_definition.arn
#   desired_count   = 1

#   network_configuration {
#     subnets          = [aws_subnet.public_subnet.id]
#     assign_public_ip = true
#     security_groups  = [aws_security_group.allow_http.id]
#   }

#   # depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role_attachment]
# }
