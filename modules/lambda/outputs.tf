output "lambda_function_name" {
  value       = aws_lambda_function.imported_lambda.function_name
  description = "The name of the imported Lambda function"
}

output "lambda_arn" {
  value       = aws_lambda_function.imported_lambda.arn
  description = "The ARN of the imported Lambda function"
}
