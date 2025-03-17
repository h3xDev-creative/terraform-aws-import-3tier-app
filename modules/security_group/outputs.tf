output "security_group_id" {
  value       = aws_security_group.imported_sg.id
  description = "The ID of the imported Security Group"
}

output "security_group_name" {
  value       = aws_security_group.imported_sg.name
  description = "The name of the imported Security Group"
}
