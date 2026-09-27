resource "aws_vpc_security_group_ingress_rule" "ssh" {
  for_each = toset(var.ssh_cidr_block)

  security_group_id = aws_security_group.this.id

  cidr_ipv4   = each.value
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "Allow SSH access"
}


resource "aws_vpc_security_group_ingress_rule" "http" {
  for_each = toset(var.http_cidr_block)

  security_group_id = aws_security_group.this.id

  cidr_ipv4   = each.value
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP access"
}