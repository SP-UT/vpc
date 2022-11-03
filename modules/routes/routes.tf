#locals {
#routes                = [for val in aws_route_table.private : val.id]
#subnet_priv_ids       = [for k, v in var.private_subnet_ids : v.subnet_id]
#priv_subnet_route_map = zipmap(local.subnet_priv_ids, local.routes)
#}
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags   = merge({ "Name" = "Public Subnets Route Table" }, var.tags)
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

#resource "aws_route_table" "private" {
#  for_each = var.private_subnet_ids
#  vpc_id   = var.vpc_id
#  tags     = merge({ "Name" = each.key }, var.tags)
#}
#resource "aws_route_table_association" "private_subnets" {
#  for_each       = local.priv_subnet_route_map
#  subnet_id      = each.key
#  route_table_id = each.value
#}

resource "aws_route_table" "az1" {
  vpc_id = var.vpc_id
  tags   = merge({ "Name" = "AZ 1 Route Table" }, var.tags)
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateways.public_subnet_1.ids[0]
  }
}

resource "aws_route_table" "az2" {
  vpc_id = var.vpc_id
  tags   = merge({ "Name" = "AZ 2 Route Table" }, var.tags)
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateways.public_subnet_2.ids[0]
  }
}

resource "aws_route_table" "az3" {
  vpc_id = var.vpc_id
  tags   = merge({ "Name" = "AZ 3 Route Table" }, var.tags)
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateways.public_subnet_3.ids[0]
  }
}
resource "aws_route_table_association" "az1" {
  count          = length(var.route_az1_map[keys(var.route_az1_map)[0]])
  subnet_id      = var.route_az1_map[keys(var.route_az1_map)[0]][count.index]
  route_table_id = aws_route_table.az1.id
}

resource "aws_route_table_association" "az2" {
  count          = length(var.route_az2_map[keys(var.route_az2_map)[0]])
  subnet_id      = var.route_az2_map[keys(var.route_az2_map)[0]][count.index]
  route_table_id = aws_route_table.az2.id
}

resource "aws_route_table_association" "az3" {
  count          = length(var.route_az3_map[keys(var.route_az3_map)[0]])
  subnet_id      = var.route_az3_map[keys(var.route_az3_map)[0]][count.index]
  route_table_id = aws_route_table.az3.id
}
