terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 5.39"
      }
    }
  }
  
  provider "aws" {
    region              = "ca-central-1" 
    allowed_account_ids = ["730335533085" ]
  }
  
  provider "aws" {
    alias               = "us-east-1"
    region              = "us-east-1"
    allowed_account_ids = ["730335533085" ]
  }