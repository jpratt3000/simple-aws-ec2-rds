terraform {
  required_version = ">= 1.0.8, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }
}
