output "rds_instance_id" {
  value       = aws_db_instance.imported_rds.id
  description = "The ID of the imported RDS instance"
}

output "rds_endpoint" {
  value       = aws_db_instance.imported_rds.endpoint
  description = "The endpoint of the RDS instance"
}
