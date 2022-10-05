locals {
    subnets = cidrsubnets(var.cidr_block, var.subnets[*].new_bits...)
    subnets_with_cidr = [for i, n in var.subnets : {
    name       = n.name
    new_bits   = n.new_bits
    cidr_block = n.name != null ? local.subnets[i] : tostring(null)
  }]
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.tags
}
