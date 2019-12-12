output "arn" {
  value = aws_lambda_function.main.arn
}

output "invoke_arn" {
  value = aws_lambda_function.main.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.main.function_name
}

output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = aws_iam_role.main.arn
}

output "role_name" {
  description = "The name of the IAM role created for the Lambda function"
  value       = aws_iam_role.main.name
}
