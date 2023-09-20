terraform {
  required_version = "0.13.5"
}

provider "aws" {
  version = "~> 5.0"
  region  = var.region
}

data "aws_availability_zones" "available" {
}