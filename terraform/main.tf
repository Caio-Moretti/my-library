terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
  
  backend "s3" {
    bucket = "terraform-state-caiomoretti"
    key = "global/s3/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-locking"
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}