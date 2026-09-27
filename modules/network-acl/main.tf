resource "aws_network_acl" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "public-nacl"
  }
}

resource "aws_network_acl" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "private-nacl"
  }
}

resource "aws_network_acl_association" "public" {
  count = length(var.public_subnet_ids)

  network_acl_id = aws_network_acl.public.id
  subnet_id      = var.public_subnet_ids[count.index]
}

resource "aws_network_acl_association" "private" {
  count = length(var.private_subnet_ids)

  network_acl_id = aws_network_acl.private.id
  subnet_id      = var.private_subnet_ids[count.index]
}