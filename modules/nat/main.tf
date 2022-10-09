resource "aws_nat_gateway" "nat_gw" {
  for_each      = var.eip_map
  subnet_id     = each.key
  allocation_id = each.value
  tags          = merge({ "Name" = "NAT Gateway for - ${each.key} subnet." }, var.tags)

}
