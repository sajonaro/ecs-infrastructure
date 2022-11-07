# Module to create a VPC network & Subnets 
module "base-network" {
  source  = "infrablocks/base-networking/aws"

  version = "4.0.0"

  vpc_cidr           = var.cidr
  region             = var.aws_region
  availability_zones = var.availability_zones
  component             = var.app_name
  deployment_identifier = var.app_environment

}
 
# Module to Create ECS cluster
/*module "ecs_cluster" {
  source = "infrablocks/ecs-cluster/aws"
  version = "3.4.0"
  
  region = "eu-west-2"
  vpc_id = "vpc-fb7dc365"
  subnet_ids = "subnet-eb32c271,subnet-64872d1f"
  
  component = "important-component"
  deployment_identifier = "production"
  
  cluster_name = "services"
  cluster_instance_ssh_public_key_path = "~/.ssh/id_rsa.pub"
  cluster_instance_type = "t2.small"
  
  cluster_minimum_size = 2
  cluster_maximum_size = 10
  cluster_desired_capacity = 4
}


#ELB
module "ecs_load_balancer" {
  source = "infrablocks/ecs-load-balancer/aws"
  version = "0.1.10"

  region = "eu-west-2"
  vpc_id = "vpc-fb7dc365"
  subnet_ids = "subnet-ae4533c4,subnet-443e6b12"
  
  component = "important-component"
  deployment_identifier = "production"
  
  service_name = "memcache"
  service_port = "11211"
  service_certificate_arn = "arn:aws:acm:eu-west-2:121408295202:certificate/4e0452c7-d32d-4abd-b5f2-69490e83c936"
  
  domain_name = "example.com"
  public_zone_id = "Z1WA3EVJBXSQ2V"
  private_zone_id = "Z3CVA9QD5NHSW3"
  
  health_check_target = "TCP:11211"
  
  allow_cidrs = [
    "100.10.10.0/24",
    "200.20.0.0/16"
  ]
  
  include_public_dns_record = "yes"
  include_private_dns_record = "yes"
  
  expose_to_public_internet = "yes"
}


# Module to Create ECS service
module "ecs_service" {
  source = "infrablocks/ecs-service/aws"
  version = "2.0.0"
  
  vpc_id = "vpc-fb7dc365"
  
  component = "important-component"
  deployment_identifier = "production"
  
  service_name = "web-app"
  service_image = "images/web-app:0.3.1"
  service_port = "8000"
  service_command = "[\"node\", \"server.js\"]"
  
  service_desired_count = "3"
  service_deployment_maximum_percent = "50"
  service_deployment_minimum_healthy_percent = "200"
  
  service_elb_name = "elb-service-web-app"
  
  service_role = "arn:aws:iam::151388205202:role/service-task-role"
  
  service_volumes = [
    {
      name = "data"
    }
  ]
  
  ecs_cluster_id = "arn:aws:ecs:eu-west-2:151388205202:cluster/web-app"
  ecs_cluster_service_role_arn = "arn:aws:iam::151388205202:role/cluster-service-role-web-app"
}*/