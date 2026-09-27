output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "elastic_ip" {
  description = "Elastic IP of NAT Gateway"
  value       = aws_eip.this.public_ip
}