terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "eu-central-1"
  # region = "sa-east-1"
}

module "downloader" {
  source = "./downloader"
}

module "invoker" {
  source      = "./invoker"
  cluster_arn = module.downloader.ecs_cluster_arn
}

output "invoker_function_url" {
  value = module.invoker.function_url
}

output "invoker_password" {
  value     = module.invoker.invoker_password
  sensitive = true
}
