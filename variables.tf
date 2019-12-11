variable "dist_dir" {
  type = string
}

variable "rsync_pattern" {
  type = list(string)
}

variable "source_dir" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "layers" {
  type    = list(string)
  default = null
}

variable "memory_size" {
  type    = number
  default = null
}

variable "timeout" {
  type    = number
  default = 3
}

variable "function_name" {
  type = string
}

variable "handler" {
  type = string
}

variable "reserved_concurrent_executions" {
  type    = number
  default = null
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "dead_letter_config" {
  type = object({
    target_arn = string
  })

  default = null
}

variable "vpc_config" {
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })

  default = null
}

variable "environment" {
  type = object({
    variables = map(string)
  })

  default = null
}

variable "tracing_config" {
  type = object({
    mode = string
  })

  default = null
}

variable "policy" {
  type = object({
    json = string
  })

  description = "An additional policy to attach to the Lambda function role"
  default     = null
}

variable "runtime" {
  type = string
}

variable "nr_alert_policy_id" {
  type    = string
  default = null
}
