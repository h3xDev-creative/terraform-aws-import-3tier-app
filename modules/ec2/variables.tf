variable "instance_id" {
  type        = string
  description = "ID of the EC2 instance to manage under Terraform"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the instance resides"
}

variable "security_group_id" {
  type        = string
  description = "Security Group ID associated with the instance"
}
