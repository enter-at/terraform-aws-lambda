## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cloudwatch_log_subscription_filter | (Optional) A list of CloudWatch Logs subscription filter. | object | `null` | no |
| dead_letter_config | (Optional) Nested block to configure the function's dead letter queue. | object | `null` | no |
| description | (Optional) Description of what the Lambda function does. | string | `null` | no |
| environment | (Optional) The Lambda environment's configuration settings. | object | `null` | no |
| force_detach_policies | (Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false. | bool | `false` | no |
| function_name | (Required) A unique name for the Lambda function. | string | - | yes |
| handler | (Required) The function entrypoint in your code. | string | - | yes |
| layers | (Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to the Lambda function. | list(string) | `null` | no |
| memory_size | (Optional) Amount of memory in MB the Lambda function can use at runtime. Defaults to 128. | number | `128` | no |
| module_name | (Optional) The location of the handler source code module. Defaults to '.' | string | `.` | no |
| policy | (Optional) An additional policy to attach to the Lambda function role. | object | `null` | no |
| provisioned_concurrent_executions | (Optional) Amount of capacity to allocate. Must be greater than or equal to 1. | number | `null` | no |
| reserved_concurrent_executions | (Optional) The amount of reserved concurrent executions for this Lambda function. | number | `null` | no |
| rsync_pattern | (Optional) A list of rsync pattern to include or exclude files and directories. | list(string) | `<list>` | no |
| runtime | (Required) The identifier of the function's runtime. | string | - | yes |
| source_dir | (Required) The location of the handler source code. | string | - | yes |
| tags | (Optional) A mapping of tags to assign to the object. | map(string) | `null` | no |
| timeout | (Optional) The amount of time the Lambda function has to run in seconds. Defaults to 3. | number | `3` | no |
| tracing_config | (Optional) A child block with a single argument mode | object | `null` | no |
| vpc_config | (Optional) Provide this to allow your function to access the VPC. | object | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) identifying the Lambda function. |
| function_name | The name identifying the Lambda function. |
| function_timeout | The amount of time the Lambda function can run in seconds. |
| function_version | The latest published version of the Lambda function. |
| invoke_arn | The ARN to be used for invoking the Lambda function |
| role_arn | The ARN of the IAM role created for the Lambda function |
| role_name | The name of the IAM role created for the Lambda function |

