
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.70.0"
    }

  backend "s3" {
    bucket =  var.bucket_name
    key    =  var.bucket_key
    region =  var.aws_region
  }
}


provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
