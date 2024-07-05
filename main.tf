terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

variable "clinc_name" {
  type = string
}

variable "callback_url" {
  type    = string
  default = "http://localhost:3000/api/auth/callback/cognito"
}

provider "aws" {
  region = "us-east-1"
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  clinc_name = var.clinc_name
}

// Entire module needs to be repurposed; not needed rn
module "cognito" {
  source       = "./modules/cognito"
  clinc_name   = var.clinc_name
  callback_url = var.callback_url
}

module "eventbridge" {
  source     = "./modules/eventbridge"
  clinc_name = var.clinc_name
}
