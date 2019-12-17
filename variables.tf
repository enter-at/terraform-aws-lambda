variable "rsync_pattern" {
  type        = list(string)
  description = "(Optional) A list of rsync pattern to include or exclude files and directories."

  default = [
    "--include=*"
  ]
}

variable "source_dir" {
  type        = string
  description = "(Required) The location of the handler source code."
}

variable "module_name" {
  type        = string
  description = "(Optional) The location of the handler source code module. Defaults to '.'"
  default     = "."
}

variable "description" {
  type        = string
  description = "(Optional) Description of what the Lambda function does."
  default     = null
}

variable "layers" {
  type = list(string)

  description = "(Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to the Lambda function."
  default     = null
}

variable "memory_size" {
  type        = number
  description = "(Optional) Amount of memory in MB the Lambda function can use at runtime. Defaults to 128."
  default     = 128
}

variable "timeout" {
  type        = number
  description = "(Optional) The amount of time the Lambda function has to run in seconds. Defaults to 3."
  default     = 3
}

variable "function_name" {
  type        = string
  description = "(Required) A unique name for the Lambda function."
}

variable "provisioned_concurrency_config" {
  type = object({
    provisioned_concurrent_executions = number
    qualifier = string
  })

  description = "(Optional) Lambda Provisioned Concurrency Configuration."
  default     = null
}

variable "handler" {
  type        = string
  description = "(Required) The function entrypoint in your code."
}

variable "reserved_concurrent_executions" {
  type        = number
  description = "(Optional) The amount of reserved concurrent executions for this Lambda function."
  default     = null
}

variable "dead_letter_config" {
  type = object({
    target_arn = string
  })

  description = "(Optional) Nested block to configure the function's dead letter queue."
  default     = null
}

variable "vpc_config" {
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })

  description = "(Optional) Provide this to allow your function to access the VPC."
  default     = null
}

variable "environment" {
  type = object({
    variables = map(string)
  })

  description = "(Optional) The Lambda environment's configuration settings."
  default     = null
}

variable "tracing_config" {
  type = object({
    mode = string
  })

  description = "(Optional) A child block with a single argument mode"
  default     = null
}

variable "policy" {
  type = object({
    json = string
  })

  description = "(Optional) An additional policy to attach to the Lambda function role."
  default     = null
}

variable "force_detach_policies" {
  type        = bool
  description = "(Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  default     = false
}

variable "publish" {
  type        = bool
  description = "(Optional) Whether to publish creation/change as new Lambda function version. Defaults to false."
  default     = false
}

variable "runtime" {
  type        = string
  description = "(Required) The identifier of the function's runtime."
}

variable "tags" {
  type = map(string)

  description = "(Optional) A mapping of tags to assign to the object."
  default     = null
}

variable "cloudwatch_log_subscription_filter" {
  type = list(object({
    name            = string
    filter_pattern  = string
    destination_arn = string
  }))

  description = "(Optional) A list of CloudWatch Logs subscription filter."
  default     = null
}
