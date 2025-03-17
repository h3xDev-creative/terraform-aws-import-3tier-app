data "aws_lambda_function" "imported_lambda" {
  function_name = var.function_name
}

output "lambda_arn" {
  value = data.aws_lambda_function.imported_lambda.arn
}
