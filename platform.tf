terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67.0"
    }
  }
  cloud {
    organization = "vip-fiap-soat"
    workspaces {
      name = "vip-eks-terraform"
    }
  }
}