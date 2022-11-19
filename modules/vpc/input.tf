variable "availability_zones" {
  default = []
}

variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
}


# vpc variable
variable "vpc_cidr" {
  description = "CIDR block for main"
  type        = string
  default     = "10.0.0.0/16"
}


variable "application_name" {
  description = "tag"
  type        = string
  default     = "my-application"
}