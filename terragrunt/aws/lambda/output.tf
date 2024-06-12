output "function_arn" {
    description = "ARN of the lambda function"
    value       = module.doc_to_html_lambda.function_arn
  }
  
  output "function_name" {
    description = "Name of the lambda function"
    value       = module.doc_to_html_lambda.function_name
  }
  
  output "invoke_arn" {
    description = "The ARN used to invoke the Lambda function"
    value       = module.doc_to_html_lambda.invoke_arn
  }
  
  output "function_url" {
    description = "The URL of the Lambda function"
    value       = aws_lambda_function_url.doc_to_html_lambda_url.function_url
  }