data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.cwd}/../invoker"
  output_path = "./invoker.zip"
  excludes    = ["node_modules", "node_modules.zip"]
}

resource "aws_lambda_function" "invoker" {
  function_name = "uakino-downloader-invoker"
  role          = aws_iam_role.lambda_role.arn

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime = "nodejs18.x"
  handler = "main.handler"

  environment {
    variables = {
      "ACCESS_PASSWORD" = random_password.user.result
      "NODE_PATH" = "/opt/node_modules"
      "NODE_ENV" = "production"
    }
  }

  layers = [aws_lambda_layer_version.node_modules.arn]
}

locals {
  layer_zip = "${path.cwd}/../invoker/node_modules.zip"
}

resource "aws_lambda_layer_version" "node_modules" {
  layer_name          = "uakino_invoker_node_modules"
  filename            = local.layer_zip
  source_code_hash    = filebase64sha256(local.layer_zip)
  compatible_runtimes = ["nodejs18.x"]
}

resource "aws_lambda_function_url" "url" {
  function_name      = aws_lambda_function.invoker.function_name
  authorization_type = "NONE"
}
