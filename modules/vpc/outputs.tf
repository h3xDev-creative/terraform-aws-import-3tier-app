output "vpc_id" {
  value       = aws_vpc.imported_vpc.id
  description = "The ID of the imported VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.imported_vpc.cidr_block
  description = "The CIDR block of the imported VPC"
}
