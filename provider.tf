terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region

}

resource "aws_s3_bucket" "tf_state"{
  bucket = "tfstate-2022"
  lifecycle {
    prevent_destroy =true
  }

  versioning {
    enabled= true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorythm ="AES256"
      }
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