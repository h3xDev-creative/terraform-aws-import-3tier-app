data "aws_db_instance" "imported_db" {
  db_instance_identifier = var.db_instance_id
}

output "rds_endpoint" {
  value = data.aws_db_instance.imported_db.endpoint
}
