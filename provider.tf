terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      
    }
  }
}

# Configure the AWS Provider
provider "aws" {
   version = "~>3.0"
   region = var.aws_region

}

 terraform {
   backend "s3" {
     bucket =  "tfstate-2022"
     key    =  "tfstate"
     region =  "eu-north-1"
   }
 }