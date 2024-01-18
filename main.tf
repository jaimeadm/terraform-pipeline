terraform {
  required_version = ">= 1.3.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40.0"
    }
  }

  /* Remote State */
  backend "s3" {
    bucket     = "tfstate-jaime"
    key        = "test/aws/s3/terraform.tfstate"
    region     = "us-east-1"
  }
}

# Configurar Provider AWS
provider "aws" {
  region = var.aws_region
  //profile = var.aws_profile
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}