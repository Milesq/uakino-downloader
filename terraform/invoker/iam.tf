resource "aws_iam_role" "lambda_role" {
  name = "uakino-lambda-role"

  inline_policy {
    policy = data.aws_iam_policy_document.allow_ecs_run_task.json
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "allow_ecs_run_task" {
  statement {
    actions   = ["ecs:RunTask"]
    effect    = "Allow"
    resources = [var.cluster_arn]
  }
}
