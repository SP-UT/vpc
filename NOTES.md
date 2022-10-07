#### Loop to create NAT Gateway (Cannot do in single module / terraform call)

```
locals{
  eips           = [for val in aws_eip.eip : val.public_ip]
  subnet_pub_ids = [for k, v in local.public_subnet_ids : v.subnet_id]
  eip_map        = zipmap(local.subnet_pub_ids, local.eips)
}
resource "aws_nat_gateway" "nat_gw" {
  for_each          = local.eip_map
  subnet_id     = each.key
  allocation_id = each.value
  depends_on = [aws_internet_gateway.gw]
  tags       = merge({ "Name" = "NAT Gateway for - ${each.key} subnet." }, var.tags)

}
```
