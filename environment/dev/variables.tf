variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string

}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  type = string
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

variable "igw_name" {
  description = "Project name"
  type        = string
}


# ===========================

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}