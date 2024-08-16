terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "lts-terraform-tfstate"
    key    = "lts-example1/terraform.tfstate"
    region = "us-east-1"
 }
}

# AWS Provider
provider "aws" {
  region = "us-east-1"
}

