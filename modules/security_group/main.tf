data "aws_security_group" "imported_sg" {
  id = "your-security-group-id"
}

output "sg_id" {
  value = data.aws_security_group.imported_sg.id
}
