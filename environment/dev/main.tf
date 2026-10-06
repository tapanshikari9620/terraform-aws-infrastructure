module "vpc" {

  source       = "../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment

}

module "networking" {
  project_name    = var.project_name
  environment     = var.environment
  source          = "../../modules/networking"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

}

module "internet_gateway" {
  source = "../../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  name   = "${var.igw_name}-${var.environment}-igw"
}

module "public_route_table" {
  source               = "../../modules/route-table"
  vpc_id               = module.vpc.vpc_id
  name                 = "${var.project_name}-public-rt"
  subnet_ids           = module.networking.public_subnet_ids
  igw_id               = module.internet_gateway.igw_id
  create_default_route = true
}



module "private_route_table" {
  source = "../../modules/route-table"

  vpc_id = module.vpc.vpc_id

  name = "${var.project_name}-private-rt"

  subnet_ids           = module.networking.private_subnet_ids
  nat_gateway_id       = module.nat_gateway.nat_gateway_id
  create_default_route = true
}
module "nat_gateway" {
  source = "../../modules/nat-gateway"

  name = "${var.project_name}-nat"

  public_subnet_id = module.networking.public_subnet_ids[0]
}


module "security_group" {
  source      = "../../modules/security-group"
  name        = "${var.project_name}-sg"
  description = "Security group for application servers"
  vpc_id      = module.vpc.vpc_id
  ssh_cidr_block = [
    "0.0.0.0/0"
  ]

  http_cidr_block = [
    "0.0.0.0/0"
  ]
}

module "network_acl" {
  source = "../../modules/network-acl"

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.networking.public_subnet_ids

  private_subnet_ids = module.networking.private_subnet_ids
}



module "ec2" {

  source = "../../modules/ec2"

  instance_name = var.instance_name

  instance_type = var.instance_type

  subnet_id = module.networking.public_subnet_ids[0]

  security_group_ids = [
    module.security_group.security_group_id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  environment = var.environment
}