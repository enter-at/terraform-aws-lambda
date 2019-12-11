resource "aws_cloudwatch_log_group" "main" {
  name = local.lambda_log_group_name
  tags = var.tags
}
