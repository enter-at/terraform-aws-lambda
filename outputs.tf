output "arn" {
  description = "The Amazon Resource Name (ARN) identifying the Lambda function."
  value       = aws_lambda_function.main.arn
}

output "invoke_arn" {
  description = "The ARN to be used for invoking the Lambda function"
  value       = aws_lambda_function.main.invoke_arn
}

output "function_name" {
  description = "The name identifying the Lambda function."
  value       = aws_lambda_function.main.function_name
}

output "function_timeout" {
  description = "The amount of time the Lambda function can run in seconds."
  value       = aws_lambda_function.main.timeout
}

output "function_version" {
  description = "The latest published version of the Lambda function."
  value       = aws_lambda_function.main.version
}

output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = aws_iam_role.main.arn
}

output "role_name" {
  description = "The name of the IAM role created for the Lambda function"
  value       = aws_iam_role.main.name
}
