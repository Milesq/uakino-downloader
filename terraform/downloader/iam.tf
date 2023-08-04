resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "allow_logs" {
  statement {
    actions   = ["logs:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "allow_logs" {
  role   = aws_iam_role.ecs_task_execution_role.name
  policy = data.aws_iam_policy_document.allow_logs.json
}


resource "aws_iam_role" "ecs_task_role" {
  name = "ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "allow_ecr" {
  statement {
    actions   = ["ecr:*"]
    effect    = "Allow"
    resources = [aws_ecr_repository.container_repo.arn]
  }

  statement {
    actions   = ["s3:*"]
    effect    = "Allow"
    resources = [aws_s3_bucket.main.arn]
  }
}

resource "aws_iam_role_policy" "allow_ecr" {
  role   = aws_iam_role.ecs_task_execution_role.name
  policy = data.aws_iam_policy_document.allow_ecr.json
}
