<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |
| null | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_log\_subscription\_filter | (Optional) A list of CloudWatch Logs subscription filter. | <pre>list(object({<br>    name            = string<br>    filter_pattern  = string<br>    destination_arn = string<br>  }))</pre> | `null` | no |
| cloudwatch\_retention\_in\_days | (Optional) Specifies the number of days you want to retain log events in the specified log group. | `any` | `null` | no |
| dead\_letter\_config | (Optional) Nested block to configure the function's dead letter queue. | <pre>object({<br>    target_arn = string<br>  })</pre> | `null` | no |
| description | (Optional) Description of what the Lambda function does. | `string` | `null` | no |
| environment | (Optional) The Lambda environment's configuration settings. | <pre>object({<br>    variables = map(string)<br>  })</pre> | `null` | no |
| force\_detach\_policies | (Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false. | `bool` | `false` | no |
| function\_name | (Required) A unique name for the Lambda function. | `string` | n/a | yes |
| handler | (Required) The function entrypoint in your code. | `string` | n/a | yes |
| layers | (Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to the Lambda function. | `list(string)` | `null` | no |
| memory\_size | (Optional) Amount of memory in MB the Lambda function can use at runtime. Defaults to 128. | `number` | `128` | no |
| module\_name | (Optional) The location of the handler source code module. Defaults to '.' | `string` | `"."` | no |
| policy | (Optional) An additional policy to attach to the Lambda function role. | <pre>object({<br>    json = string<br>  })</pre> | `null` | no |
| provisioned\_concurrency\_config | (Optional) Lambda Provisioned Concurrency Configuration. | <pre>object({<br>    provisioned_concurrent_executions = number<br>    qualifier                         = string<br>  })</pre> | `null` | no |
| publish | (Optional) Whether to publish creation/change as new Lambda function version. Defaults to false. | `bool` | `false` | no |
| reserved\_concurrent\_executions | (Optional) The amount of reserved concurrent executions for this Lambda function. | `number` | `null` | no |
| rsync\_pattern | (Optional) A list of rsync pattern to include or exclude files and directories. | `list(string)` | <pre>[<br>  "--include=*"<br>]</pre> | no |
| runtime | (Required) The identifier of the function's runtime. | `string` | n/a | yes |
| source\_dir | (Required) The location of the handler source code. | `string` | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the object. | `map(string)` | `null` | no |
| timeout | (Optional) The amount of time the Lambda function has to run in seconds. Defaults to 3. | `number` | `3` | no |
| tracing\_config | (Optional) A child block with a single argument mode | <pre>object({<br>    mode = string<br>  })</pre> | `null` | no |
| vpc\_config | (Optional) Provide this to allow your function to access the VPC. | <pre>object({<br>    security_group_ids = list(string)<br>    subnet_ids         = list(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) identifying the Lambda function. |
| function\_name | The name identifying the Lambda function. |
| function\_timeout | The amount of time the Lambda function can run in seconds. |
| function\_version | The latest published version of the Lambda function. |
| invoke\_arn | The ARN to be used for invoking the Lambda function |
| role\_arn | The ARN of the IAM role created for the Lambda function |
| role\_name | The name of the IAM role created for the Lambda function |

<!-- markdownlint-restore -->
