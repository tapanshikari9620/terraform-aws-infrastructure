resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
    Environment = var.environment
    managed_by = "terraform"
  }
}


resource "aws_subnet" "public"{
  for_each=var.public_subnets
  vpc_id = aws_vpc.main.id
  cidr_block=each.value.cidr
  availability_zone = each.value.az

   tags = {
    Name        = "${var.project_name}-${each.key}"
    Environment = var.environment
    Tier        = "Public"
    managed_by  = "terraform"
  }
 
 

}

resource "aws_subnet" "private"{
  for_each=var.private_subnets
  vpc_id = aws_vpc.main.id
  cidr_block=each.value.cidr
  availability_zone = each.value.az

   tags = {
    Name        = "${var.project_name}-${each.key}"
    Environment = var.environment
    Tier        = "Private"
    managed_by  = "terraform"
  }
}