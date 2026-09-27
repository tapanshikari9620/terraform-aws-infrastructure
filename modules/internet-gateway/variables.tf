variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created."
  type        = string
}

variable "name" {
    description = "The name of the Internet Gateway."
    type        = string
}