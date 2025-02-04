# Definir o provider
provider "aws" {
  region = "us-east-2"
}

# Backend (opcional)
terraform {
  backend "s3" {
    bucket = "devs2blu2025"  # Nome do bucket S3
    key     = "terraform.tfstate"
    region  = "us-east-2"  # Região do S3
  }
}

