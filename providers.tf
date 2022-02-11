terraform {
  required_version = ">= 1.0.11"
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}
