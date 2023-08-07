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

    environment = [
      {
        name  = "S3_OUTPUT"
        value = aws_s3_bucket.main.id
      }
    ]

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-create-group": "true",
        "awslogs-group"         = "uakino"
        "awslogs-region"        = "eu-central-1"
        "awslogs-stream-prefix" = "uakino"
      }
    }
  }])
}
