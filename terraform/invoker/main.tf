resource "aws_lambda_function" "invoker" {
  function_name = "uakino-downloader-invoker"
  role          = aws_iam_role.lambda_role.name
}

resource "aws_lambda_function_url" "url" {
  function_name      = aws_lambda_function.invoker.function_name
  authorization_type = "AWS_IAM"
}
