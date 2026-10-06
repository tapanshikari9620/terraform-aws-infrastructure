# ------------------------------------------------------------
# Latest Amazon Linux 2023 AMI
# ------------------------------------------------------------

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# ------------------------------------------------------------
# EC2 Instance
# ------------------------------------------------------------

resource "aws_instance" "this" {

  # AMI selected by the data source above
  ami = data.aws_ami.amazon_linux.id

  # EC2 instance type
  instance_type = var.instance_type

  # Subnet where EC2 will be created
  subnet_id = var.subnet_id

  # Security groups attached to EC2
  vpc_security_group_ids = var.security_group_ids

  # AWS key pair used for SSH
  key_name = var.key_name

  # Public IP configuration
  associate_public_ip_address = var.associate_public_ip_address

  # Root EBS volume
  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  # Require IMDSv2
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  # Tags
  tags = {
    Name        = var.instance_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}