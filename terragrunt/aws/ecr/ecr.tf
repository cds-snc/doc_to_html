resource "aws_ecr_repository" "doc_to_hmtl_ecr" {
  name                 = "doc_to_hmtl_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    CostCentre = "DocToHtml"
    Terraform  = true
  }
}

resource "aws_ecr_lifecycle_policy" "doc_to_hmtl_expire_untagged" {
  repository = aws_ecr_repository.api.name
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
