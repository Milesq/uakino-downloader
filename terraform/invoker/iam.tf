resource "aws_iam_role" "lambda_role" {
  name = "uakino-lambda-role"

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
    resources = [var.downloader_params.CLUSTER_NAME]
  }
}

resource "aws_iam_role_policy" "allow_ecs_run_task" {
  role   = aws_iam_role.lambda_role.name
  policy = data.aws_iam_policy_document.allow_ecs_run_task.json
}

resource "aws_iam_role_policy_attachment" "basic_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
