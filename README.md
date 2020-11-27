<!--

  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **

  -->

# terraform-aws-lambda
 [![Build Status](https://github.com/enter-at/terraform-aws-lambda/workflows/Terraform%20Lint/badge.svg)](https://github.com/enter-at/terraform-aws-lambda/actions) [![Latest Release](https://img.shields.io/github/release/enter-at/terraform-aws-lambda.svg)](https://github.com/enter-at/terraform-aws-lambda/releases/latest) [![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)


Terraform module designed to facilitate the creation of AWS Lambda functions.


---


It's 100% Open Source and licensed under the [APACHE2](LICENSE).







## Usage


**IMPORTANT:** The `main` branch is used in `source` just as an example. In your code, do not pin to `main` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/enter-at/terraform-aws-lambda/releases).


### Simple Example

```hcl
module "lambda" {
  source        = "git::https://github.com/enter-at/terraform-aws-lambda.git?ref=master"
  function_name = "test-service"
  handler       = "service/handler"
  source_dir    = var.source_dir
  runtime       = var.runtime

  rsync_pattern = [
    "--include='*.js'"
  ]
}
```
### Advanced Example

```hcl
locals {
  service_dir = "account-data"
}

module "lambda" {
  source        = "git::https://github.com/enter-at/terraform-aws-lambda.git?ref=master"
  function_name = "test-service"
  handler       = "${local.service_dir}/handler"
  source_dir    = var.source_dir
  runtime       = var.runtime
  layers        = var.layers
  publish       = true

  provisioned_concurrency_config = {
    qualifier                         = aws_lambda_alias.production.name
    provisioned_concurrent_executions = var.provisioned_concurrent_executions
  }

  rsync_pattern = [
    "--include={lib,domain,${local.service_dir}}/",
    "--include='*.js'"
  ]

  policy = {
    json = data.aws_iam_policy_document.main.json
  }

  environment = {
    variables = {
      SM_SERVICE_CONFIG = var.secrets_manager_secret.arn
    }
  }

  vpc_config = {
    subnet_ids = var.private_subnet_ids

    security_group_ids = [
      var.security_group_id
    ]
  }

  tags = {
    "Team" = "XYZ"
  }
}

resource "aws_lambda_alias" "production" {
  function_name    = module.lambda.function_name
  function_version = module.lambda.function_version
  name             = "production"
}
```








<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

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



## Share the Love

Like this project?
Please give it a ★ on [our GitHub](https://github.com/enter-at/terraform-aws-lambda)!


## Related Projects

Check out these related projects.

- [terraform-aws-lambda-layer](https://github.com/enter-at/terraform-aws-lambda-layer) - Terraform module designed to facilitate the creation of AWS Lambda layers.
- [terraform-newrelic-alert-lambda](https://github.com/enter-at/terraform-newrelic-alert-lambda) - Terraform Module to define New Relic alerts for AWS Lambda functions.



## Help

**Got a question?**

File a GitHub [issue](https://github.com/enter-at/terraform-aws-lambda/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/enter-at/terraform-aws-lambda/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project, we would love to hear from you!

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!





## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.



