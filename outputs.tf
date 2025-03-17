output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

output "rds_instance_id" {
  value = module.rds.rds_instance_id
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}
