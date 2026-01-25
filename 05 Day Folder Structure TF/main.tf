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

