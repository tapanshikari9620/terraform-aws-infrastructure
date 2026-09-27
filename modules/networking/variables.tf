   variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
   }

   variable "project_name" {
    description = "The name of the project"
    type        = string
   }

   variable "environment"{
    type=string
   }

  

   variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}