
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = "10.20.0.0/16"
  project_name = "github-actions"
  environment  = "practice"
}
