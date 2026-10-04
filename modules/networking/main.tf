resource "aws_subnet" "public"{
  for_each=var.public_subnets
  vpc_id = var.vpc_id
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
  vpc_id = var.vpc_id
  cidr_block=each.value.cidr
  availability_zone = each.value.az

   tags = {
    Name        = "${var.project_name}-${each.key}"
    Environment = var.environment
    Tier        = "Private"
    managed_by  = "terraform"
  }
}