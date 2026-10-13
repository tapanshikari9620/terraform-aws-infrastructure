
output "vpc_id" {
  description = "ID of the GitHub Actions practice VPC"
  value       = module.vpc.vpc_id
}
