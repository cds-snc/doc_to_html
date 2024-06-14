module "doc_to_html_lambda" {
    source                 = "github.com/cds-snc/terraform-modules//lambda?ref=v9.4.4"
    name                   = "doc_to_html-lambda"
    billing_tag_value      = "DocToHtml"
    ecr_arn                = var.ecr_repository_arn
    enable_lambda_insights = true
    image_uri              = "${var.ecr_repository_url}:latest"
    memory                 = 128 
    timeout                = 5 
  }
  
  resource "aws_lambda_alias" "doc_to_html_lambda_alias" {
    name             = "latest"
    description      = "The latest version of the lambda function"
    function_name    = module.doc_to_html_lambda.function_name
    function_version = "1"
  
    lifecycle {
      ignore_changes = [
        function_version,
      ]
    }
  }
  
  resource "aws_lambda_function_url" "doc_to_html_lambda_url" {
    function_name      = module.doc_to_html_lambda.function_name
    qualifier          = aws_lambda_alias.doc_to_html_lambda_alias.name

    authorization_type = "NONE"
  }