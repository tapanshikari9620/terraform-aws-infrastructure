   
  variable "vpc_id" {
  description = "ID of the VPC where networking resources will be created"
  type        = string
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

variable "project_name" {
    description = "The name of the project"
    type        = string
   }

   variable "environment"{
    type=string
   }
