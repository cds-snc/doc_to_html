################################################################################
# ECR Repository 
################################################################################

output "ecr_repository_url" {
  description = "URL of the Doc_to_html ECR"
  value       = aws_ecr_repository.doc_to_hml_ecr.repository_url
}

output "ecr_repository_arn" {
  description = "Arn of the Doc_to_html ECR Repository"
  value       = aws_ecr_repository.doc_to_hml_ecr.arn
}