terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19.0"
      
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
     bucket =  var.bucket_name
     key    =  var.bucket_key
     region =  var.aws_region
   }
 }