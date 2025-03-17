data "aws_vpc" "imported_vpc" {
  id = "your-vpc-id"
}

output "vpc_id" {
  value = data.aws_vpc.imported_vpc.id
}
