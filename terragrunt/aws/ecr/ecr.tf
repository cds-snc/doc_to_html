resource "aws_ecr_repository" "doc_to_html_ecr" {
  # checkov:skip=CKV_AWS_51:The :latest tag is used in Staging
  # checkov:skip=CKV_AWS_136: ECR encryption with default KMS key is acceptable

  name                 = "doc_to_html_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    CostCentre = "DocToHtml"
    Terraform  = true
  }
}

resource "aws_ecr_lifecycle_policy" "doc_to_html_expire_untagged" {
  repository = aws_ecr_repository.doc_to_html_ecr.name
  policy = jsonencode({
    "rules" : [
      {
        "rulePriority" : 1,
        "description" : "Expire untagged images older than 14 days",
        "selection" : {
          "tagStatus" : "untagged",
          "countType" : "sinceImagePushed",
          "countUnit" : "days",
          "countNumber" : 14
        },
        "action" : {
          "type" : "expire"
        }
      },
      {
        "rulePriority" : 2,
        "description" : "Keep last 20 tagged images",
        "selection" : {
          "tagStatus" : "tagged",
          "tagPrefixList" : ["latest"],
          "countType" : "imageCountMoreThan",
          "countNumber" : 20
        },
        "action" : {
          "type" : "expire"
        }
      }
    ]
  })
}
