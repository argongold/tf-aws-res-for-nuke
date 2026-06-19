terraform {
  required_version = "~>1.14.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.47.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7"
    }
  }
  backend "s3" {
    encrypt = true

  }
}

provider "aws" {
  region = var.aws_region
}