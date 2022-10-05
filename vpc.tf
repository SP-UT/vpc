locals {
    subnets = cidrsubnets(var.cidr_block, var.subnets[*].new_bits...)
    #subnet_with_cidr = [ -> Work needed here to iterate over local.subnets
    #for subnet in var.subnets:
    #  merge(subnet, {cidr = local.subnets[subnet]})
    #]
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.tags
}
