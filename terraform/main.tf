terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "sa-east-1"
}

module "downloader" {
  source = "./downloader"
}

module "invoker" {
  source     = "./invoker"
  downloader_params = module.downloader.params
}

output "invoker_function_url" {
  value = module.invoker.function_url
}

output "invoker_password" {
  value     = module.invoker.invoker_password
  sensitive = true
}
