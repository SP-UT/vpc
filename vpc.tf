module "vpc" {
  source               = "./modules/vpc/"
  cidr_block           = var.cidr_block
  region               = var.region
  vpc_name             = var.vpc_name
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.tags
  subnets              = var.subnets
}

module "igw" {
  source   = "./modules/igw/"
  vpc_name = var.vpc_name
  vpc_id   = module.vpc.vpc_id
  tags     = var.tags
}

module "eip" {
  source            = "./modules/eip/"
  public_subnet_ids = module.vpc.public_subnet_ids
  tags              = var.tags
}
