data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.cwd}/../invoker"
  output_path = "./downloader.zip"
}

resource "aws_lambda_function" "invoker" {
  function_name = "uakino-downloader-invoker"
  role          = aws_iam_role.lambda_role.arn

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime = "nodejs18.x"
  handler = "main.handler"
}

resource "aws_lambda_function_url" "url" {
  function_name      = aws_lambda_function.invoker.function_name
  authorization_type = "NONE"
}
