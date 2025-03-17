output "ec2_instance_id" {
  value       = aws_instance.imported_ec2.id
  description = "The ID of the imported EC2 instance"
}

output "ec2_public_ip" {
  value       = aws_instance.imported_ec2.public_ip
  description = "The public IP of the EC2 instance"
}
