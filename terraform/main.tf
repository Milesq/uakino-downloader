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
