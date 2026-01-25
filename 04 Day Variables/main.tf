terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
    backend "s3" {
    bucket = "myuniquebucket-terraformano"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Input variable for environment

variable "environment" {
  default = "Dev"
  type = string
}


# Create s3 bucket
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "mys3bucket2111-06-27"

    tags = {
        Environment = var.environment                   # input variable usage
        Name        = "${var.environment}-S3-Bucket"    # local variable usage
        
    }
}

#created vpc

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.1.0/24"
  tags ={
    Environment = var.environment
    Name        = "${var.environment}-VPC"
  }
}

# created ec2 instance

resource "aws_instance" "sampleec2" {
  ami           = "ami-02d26659fd82cf299" // Ubuntu , SSD Volume Type for ap-south-1 region
  instance_type = "t3.micro"  

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-EC2-Instance"
  }
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "ec2_id" {
  value = aws_instance.sampleec2.id
}

# To see only the outputs, run: terraform output