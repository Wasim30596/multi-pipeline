terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
  # backend "s3" {
  #   bucket = "my-terraform-state-bucket-1604"
  #   key    = "dev/terraform.tfstate"
  #   region = "ap-southeast-1"
  #   dynamodb_table = "terraform-lock-table"
  # }
}

provider "aws" {
  region = var.aws_region
}