resource "aws_network_acl_rule" "public_http_in" {
  network_acl_id = aws_network_acl.public.id

  rule_number = 100
  egress      = false

  protocol   = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 80
  to_port   = 80
}

resource "aws_network_acl_rule" "public_https_in" {
  network_acl_id = aws_network_acl.public.id

  rule_number = 110
  egress      = false

  protocol   = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 443
  to_port   = 443
}

resource "aws_network_acl_rule" "public_ssh_in" {
  network_acl_id = aws_network_acl.public.id

  rule_number = 120
  egress      = false

  protocol   = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 22
  to_port   = 22
}

resource "aws_network_acl_rule" "public_ephemeral_in" {
  network_acl_id = aws_network_acl.public.id

  rule_number = 130
  egress      = false

  protocol   = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 1024
  to_port   = 65535
}

resource "aws_network_acl_rule" "private_tcp_in" {
  network_acl_id = aws_network_acl.private.id

  rule_number = 100
  egress      = false

  protocol   = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 1024
  to_port   = 65535
}

resource "aws_network_acl_rule" "private_http_in" {
  network_acl_id = aws_network_acl.private.id

  rule_number = 110
  egress      = false

  protocol   = "tcp"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 80
  to_port   = 80
}