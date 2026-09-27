variable "name" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID where NAT Gateway will be created"
  type        = string
}