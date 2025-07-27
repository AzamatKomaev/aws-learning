terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket     = "azamatkomaev-terraform-state-2518208dbf231283d"
    region     = "eu-central-1"
    key        = "terraform/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-central-1"
}

