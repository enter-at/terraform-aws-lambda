## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dead_letter_config | - | object | `null` | no |
| description | - | string | `null` | no |
| dist_dir | - | string | - | yes |
| environment | - | object | `null` | no |
| function_name | - | string | - | yes |
| handler | - | string | - | yes |
| layers | - | list(string) | `null` | no |
| memory_size | - | number | `null` | no |
| nr_alert_policy_id | - | string | `null` | no |
| policy | An additional policy to attach to the Lambda function role | object | `null` | no |
| reserved_concurrent_executions | - | number | `null` | no |
| rsync_pattern | - | list(string) | - | yes |
| runtime | - | string | - | yes |
| source_dir | - | string | - | yes |
| tags | - | map(string) | `null` | no |
| timeout | - | number | `3` | no |
| tracing_config | - | object | `null` | no |
| vpc_config | - | object | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | - |
| function_name | - |
| invoke_arn | - |
| role_arn | The ARN of the IAM role created for the Lambda function |
| role_name | The name of the IAM role created for the Lambda function |

