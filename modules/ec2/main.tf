data "aws_instance" "imported_instance" {
  instance_id = var.instance_id
}

output "instance_id" {
  value = data.aws_instance.imported_instance.id
}
