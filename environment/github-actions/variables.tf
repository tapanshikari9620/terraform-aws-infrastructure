
variable "aws_region" {
  description = "AWS region for GitHub Actions practice"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the practice VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "github-actions"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "practice"
}
