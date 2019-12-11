locals {
  partition             = data.aws_partition.current.partition
  account_id            = data.aws_caller_identity.current.account_id
  lambda_log_group_name = "/aws/lambda/${var.function_name}"
  lambda_log_group_arn  = "arn:${local.partition}:logs:*:${local.account_id}:log-group:${local.lambda_log_group_name}"
}
