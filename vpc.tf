module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  region               = var.region
  vpc_name             = var.vpc_name
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.tags
  subnets              = var.subnets
}

module "igw" {
  source   = "./modules/igw"
  vpc_name = var.vpc_name
  vpc_id   = module.vpc.vpc_id
  tags     = var.tags
}

module "eip" {
  source            = "./modules/eip"
  public_subnet_ids = module.vpc.public_subnet_ids
  depends_on        = [module.igw]
  tags              = var.tags
}

module "nat" {
  source     = "./modules/nat"
  eip_map    = module.eip.eip_map
  depends_on = [module.igw]
  tags       = var.tags
}

module "routes" {
  source             = "./modules/routes"
  vpc_id             = module.vpc.vpc_id
  tags               = var.tags
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  igw                = module.igw.igw[join("-", [var.vpc_name, "IGW"])]
  route_az1_map      = module.vpc.route_az1_map
  route_az2_map      = module.vpc.route_az2_map
  route_az3_map      = module.vpc.route_az3_map
  depends_on         = [module.igw, module.eip, module.nat]
}
