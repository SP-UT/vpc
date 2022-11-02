locals {
  routes                = [for val in aws_route_table.private : val.id]
  subnet_priv_ids       = [for k, v in var.private_subnet_ids : v.subnet_id]
  priv_subnet_route_map = zipmap(local.subnet_priv_ids, local.routes)
}
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags   = merge({ "Name" = "Public Subnets Route Table" }, var.tags)
}

resource "aws_route_table" "private" {
  for_each = var.private_subnet_ids
  vpc_id   = var.vpc_id
  tags     = merge({ "Name" = each.key }, var.tags)
}

resource "aws_route_table_association" "public_subnets" {
  for_each       = var.public_subnet_ids
  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_routes" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw
}

resource "aws_route_table_association" "private_subnets" {
  for_each       = local.priv_subnet_route_map
  subnet_id      = each.key
  route_table_id = each.value
}
