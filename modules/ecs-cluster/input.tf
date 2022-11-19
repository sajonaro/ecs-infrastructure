variable "service_port" {
  default = 80
}

variable "region" {
  
}

variable "include_log_group" {
  default ="no"
}

variable "application_name" {
  description = "tag"
  type        = string
  default     = "my-application"
}

variable "service_task_network_mode" {
  default = "awsvpc"
  
}

variable "service_task_pid_mode" {
  
}

variable "service_role" {
  
}

variable "component" {
  
}

variable "service_name" {
  
}

variable "deployment_identifier" {
  
}

variable "service_command" {
  default = ""
}

variable "RAM" {
  default = 200
}

variable "CPU" {
  default = 512
}

variable "desired_count" {
  default = 1
}

variable "launch_type" {
  default="EC2"
}