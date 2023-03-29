# Providers are a logical abstration of an upstream API. They help to understand
# API Interactions and exposing provider resources such AWS, Google, Azure

provider "aws"{
    region= var.na-region
}

data "aws_availability_zones" "aws_az" {}

module "vpc"{
    source = "terraform-aws-modules/vpc/aws"
    name = var.vpc_name
    cidr = var.vpc_cidr_block
    azs= data.aws_availability_zones.aws_az.names
    private_subnets = ["10.0.1.0/28","10.0.2.0/28","10.0.3.0/28"]
    public_subnets = ["10.0.4.0/28","10.0.5.0/28","10.0.6.0/28"]
    enable_nat_gateway= true
    single_nat_gateway = 
    enable_dns_hostnames = true
    tags = {
      Terraform = "true"
      Environment = "dev"  
    }
}