#################
# Local variables
#################

locals {
  availability_zones = ["eu-west-1a", "eu-west-1b"]
}

############################
# AWS provider for Terraform
############################

provider "aws" {
  region  = "${var.region}"
}

#######################
# AWS Key pair resource
############################

resource "aws_key_pair" "key" {
  key_name   = "public_key"
  public_key = "${var.public_key}}"
}
######################################
# Elastic container service VPC module
######################################

module "elastic-container-vpc" {
  source               = "../modules/elastic-container-vpc"
  environment          = "codechallenge"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = "${var.region}"
  availability_zones   = "${local.availability_zones}"
  key_name             = "${aws_key_pair.key.key_name}"
}

##################################
# Elastic container service module
##################################

module "elastic-service" {
  source              = "../modules/elastic-service"
  environment         = "codechallenge"
  vpc_id              = "${module.elastic-container-vpc.vpc_id}"
  availability_zones  = "${local.availability_zones}"
  repository_name     = "code/codechallenge"
  subnets_ids         = ["${module.elastic-container-vpc.private_subnets_id}"]
  public_subnet_ids   = ["${module.elastic-container-vpc.public_subnets_id}"]
  security_groups_ids = [
    "${module.elastic-container-vpc.security_groups_ids}",
  ]
}