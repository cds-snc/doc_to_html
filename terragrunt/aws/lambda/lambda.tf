module "doc_to_html_lambda" {
    source                 = "github.com/cds-snc/terraform-modules//lambda?ref=v9.4.4"
    name                   = "doc_to_html-lambda"
    billing_tag_value      = "DocToHtml"
    ecr_arn                = "arn:aws:ecr:ca-central-1:730335533085:repository/doc_to_html_ecr"
    enable_lambda_insights = true
    image_uri              = "730335533085.dkr.ecr.ca-central-1.amazonaws.com/doc_to_html_ecr:latest"
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