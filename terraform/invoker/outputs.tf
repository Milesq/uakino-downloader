output "function_url" {
  value = aws_lambda_function_url.url.function_url
}

output "invoker_password" {
  value     = random_password.user.result
  sensitive = true
}
