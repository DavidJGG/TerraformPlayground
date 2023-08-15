terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region[terraform.workspace]
  profile = var.profile_names[terraform.workspace]
}