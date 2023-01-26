data "aws_availability_zones" "available" {
}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "~> 3.0"
  name                 = var.vpc.name
  cidr                 = var.vpc.cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.vpc.private_subnets # Worker Nodes
  public_subnets       = var.vpc.public_subnets  # NAT
  enable_nat_gateway   = var.vpc.enable_nat_gateway
  single_nat_gateway   = var.vpc.single_nat_gateway
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${local.region}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = module.vpc.private_route_table_ids[0]
}

# TODO: Configure private endpoints to ECR

# resource "aws_vpc_endpoint" "ecr_dkr" {
#   vpc_id       = module.vpc.vpc_id
#   service_name = "com.amazonaws.${local.region}.ecr.dkr"
#   vpc_endpoint_type = "Interface"
#   subnet_ids = module.vpc.public_subnets 
# }

# resource "aws_vpc_endpoint" "ecr_api" {
#   vpc_id       = module.vpc.vpc_id
#   service_name = "com.amazonaws.${local.region}.ecr.api"
#   vpc_endpoint_type = "Interface"
#   subnet_ids = module.vpc.public_subnets
# }
