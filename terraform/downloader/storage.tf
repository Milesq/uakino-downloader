resource "aws_ecr_repository" "container_repo" {
  name = "container_repo"
}

provider "aws" {
  alias  = "eu"
  region = "eu-central-1"
}

resource "aws_s3_bucket" "main" {
  provider = aws.eu
  bucket   = "uakino-downloader-artifacts"
}
