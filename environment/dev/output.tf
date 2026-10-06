output "vpc_id" {
  value = module.vpc.vpc_id

}


output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_private_ip" {
  description = "EC2 private IP"
  value       = module.ec2.private_ip
}

output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = module.ec2.public_ip
}

output "ec2_availability_zone" {
  description = "EC2 Availability Zone"
  value       = module.ec2.availability_zone
}

