################################################################################
# ECR Repository 
################################################################################

output "ecr_repository_url" {
  description = "URL of the URL shortener ECR"
  value       = aws_ecr_repository.doc_to_hml_ecr.repository_url
}

output "ecr_repository_arn" {
  description = "Arn of the ECR Repository"
  value       = aws_ecr_repository.doc_to_hml_ecr.arn
}