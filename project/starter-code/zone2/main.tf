locals {
   account_id = data.aws_caller_identity.current.account_id

   name   = "udacity"
   region = "us-west-1"
   tags = {
     Name      = local.name
     Terraform = "true"
   }
 }
module "alb" {
   source             = "./modules/alb"
   ec2                = module.project_ec2.aws_instance
   ec2_sg             = module.project_ec2.ec2_sg
   subnet_id          = data.terraform_remote_state.vpc.outputs.public_subnet_ids
   vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
 }
#  module "vpc" {
#    source     = "./modules/vpc"
#    cidr_block = "10.100.0.0/16"

#    account_owner = local.name
#    name          = "${local.name}-project"
#    azs           = ["us-east-2a", "us-east-2b", "us-east-2c"]
#    private_subnet_tags = {
#      "kubernetes.io/role/internal-elb" = 1
#    }
#    public_subnet_tags = {
#      "kubernetes.io/role/elb" = 1
#    }
#  }

#   module "vpc_west" {
#    source     = "./modules/vpc"
#    cidr_block = "10.100.0.0/16"

#    account_owner = local.name
#    name          = "${local.name}-project"
#    azs           = ["us-west-1a", "us-west-1b"]
#    private_subnet_tags = {
#      "kubernetes.io/role/internal-elb" = 1
#    }
#    public_subnet_tags = {
#      "kubernetes.io/role/elb" = 1
#    }
#   providers = {
#     aws = aws.usw1
#   }
#  }