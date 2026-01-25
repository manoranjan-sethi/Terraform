output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "ec2_id" {
  value = aws_instance.sampleec2.id
}

# To see only the outputs, run: terraform output