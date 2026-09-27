resource "aws_network_acl_rule" "public_all_out" {
  network_acl_id = aws_network_acl.public.id

  rule_number = 100
  egress      = true

  protocol   = "-1"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_all_out" {
  network_acl_id = aws_network_acl.private.id

  rule_number = 100
  egress      = true

  protocol   = "-1"
  rule_action = "allow"

  cidr_block = "0.0.0.0/0"
}