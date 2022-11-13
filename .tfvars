aws_region     = "eu-north-1"

# these are zones and subnets examples
cidr               = "10.0.0.0/16"
availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
public_subnets     = ["10.10.100.0/24", "10.10.101.0/24", "10.10.102.0/24"]
private_subnets    = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]

# these are used for tags
app_name        = "clinic"
app_environment = "prod"