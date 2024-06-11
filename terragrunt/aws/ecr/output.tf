################################################################################
# ECR Repository 
################################################################################

output "ecr_repository_url" {
  description = "URL of the URL shortener ECR"
  value       = module.doc_to_hml_ecr.repository_url
}

output "ecr_repository_arn" {
  description = "Arn of the ECR Repository"
  value       = module.doc_to_hml_ecr.arn
}