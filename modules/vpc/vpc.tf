locals {
  subnets = cidrsubnets(var.cidr_block, var.subnets[*].new_bits...)
  subnets_with_cidr = [for i, n in var.subnets : {
    name       = n.name
    az         = n.az
    cidr_block = n.name != null ? local.subnets[i] : tostring(null)
  }]
  subnt_map = { for s in local.subnets_with_cidr : s.name => { az = s.az, cidr_block = s.cidr_block } }
  private_subnet_ids = {
    for val in aws_subnet.main : val.tags.Name => {
      subnet_id = val.id
    }
    if !can(regex("^Public Subnet [[:digit:]]", val.tags.Name))
  }
  public_subnet_ids = {
    for val in aws_subnet.main : val.tags.Name => {
      subnet_id = val.id
    }
    if can(regex("^Public Subnet [[:digit:]]", val.tags.Name))
  }
  routes                = [for val in aws_route_table.private : val.id]
  subnet_priv_ids       = [for k, v in local.private_subnet_ids : v.subnet_id]
  priv_subnet_route_map = zipmap(local.subnet_priv_ids, local.routes)
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge({ "Name" = var.vpc_name }, var.tags)
}

resource "aws_subnet" "main" {
  for_each          = local.subnt_map
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = join("", [var.region, each.value.az])
  tags              = merge({ "Name" = each.key }, var.tags)
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = merge({ "Name" = "Public Subnets Route Table" }, var.tags)
}

resource "aws_route_table" "private" {
  for_each = local.private_subnet_ids
  vpc_id   = aws_vpc.main.id
  tags     = merge({ "Name" = each.key }, var.tags)
}

resource "aws_route_table_association" "public_subnets" {
  for_each       = local.public_subnet_ids
  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnets" {
  for_each       = local.priv_subnet_route_map
  subnet_id      = each.key
  route_table_id = each.value
}
