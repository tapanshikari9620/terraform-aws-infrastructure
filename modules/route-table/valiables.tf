variable "vpc_id" {
type=string
}

variable "name"{
    type=string
}
variable "subnet_ids" {
    type=list(string)
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
  default     = null
}
variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
  default     = null
}

variable "create_default_route" {
  description = "Whether to create the default internet route"
  type        = bool
  default     = false
}