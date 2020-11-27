provider "aws" {
  region = "eu-central-1"
}

module "lambda" {
  source        = "../"
  function_name = "test-service"
  handler       = "service/handler.handle"
  source_dir    = "./src"
  runtime       = "nodejs10.x"

  rsync_pattern = [
    "--include=*.js"
  ]
}
