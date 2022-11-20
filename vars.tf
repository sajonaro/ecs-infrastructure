# variables.tf | Auth and Application variables

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "aws_cloudwatch_retention_in_days" {
  type        = number
  description = "AWS CloudWatch Logs Retention in Days"
  default     = 1
}

variable "app_name" {
  type        = string
  description = "Application Name"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnets"
  default     = []
}

variable "private_subnets" {
  description = "List of private subnets"
  default     = []
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = []
}

variable "cluster_instance_type" {
}

variable "cluster_minimum_size" {
}

variable "cluster_maximum_size" {
}

variable "cluster_desired_capacity" {
}

variable "service_port" {

}

variable "domain_name" {

}