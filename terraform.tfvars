# variables.tf

variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-1"  # Default region if not provided by the environment variable
}
