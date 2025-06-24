provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "FanoyG98"
  region                   = "ap-south-1"
}

module "vpc" {
  source       = "../../modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
  project_name = "cloudforge"


  availability_zones = ["ap-south-1a", "ap-south-1b"]
  public_subnets     = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]


  default_tags = {
    Owner       = "Fanoy"
    Project     = "VPC-Builder"
    ManagedBy   = "Terraform"
    Environment = "dev"
  }

}


module "iam" {
  source     = "../../modules/iam"
  group_name           = var.group_name
  user_names           = var.user_names
  group_policy_arns    = var.group_policy_arns
  default_tags         = var.default_tags

}