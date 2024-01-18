# Armazenar o state no backend da AWS
terraform {
  # Definir Provider AWS
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
  # Definir Backend para armazenar o arquivo tfstate
  # backend "s3" {
  #   bucket = "tfstate-jaimeadm"
  #   key    = "prod/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

# Configurar Provider AWS
provider "aws" {
  region  = var.aws_region
  //profile = var.aws_profile
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}