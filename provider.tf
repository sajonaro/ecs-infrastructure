terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-north-1"

}

resource "aws_s3_bucket" "tf_state" {
  bucket = "tfstate-2022"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.tf_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


terraform {
  backend "s3" {
    bucket = "tfstate-2022"
    key    = "global/s3/terraform.tfstate"
    region = "eu-north-1"
    encrypt = true
  }
}
