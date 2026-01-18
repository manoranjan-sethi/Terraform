terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create s3 bucket
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-tf-unique-bucket2111-06-27"

    tags = {
        Name        = "My bucket 2.0"
        Environment = "Dev"
    }
}