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

#### Error at `terragrunt apply`

```
terragrunt apply
╷
│ Error: Invalid for_each argument
│ 
│   on vpc.tf line 54, in resource "aws_nat_gateway" "nat_gw":
│   54:   for_each          = local.eip_map
│     ├────────────────
│     │ local.eip_map will be known only after apply
│ 
│ The "for_each" map includes keys derived from resource attributes that
│ cannot be determined until apply, and so Terraform cannot determine the
│ full set of keys that will identify the instances of this resource.
│ 
│ When working with unknown values in for_each, it's better to define the map
│ keys statically in your configuration and place apply-time results only in
│ the map values.
│ 
│ Alternatively, you could use the -target planning option to first apply
│ only the resources that the for_each value depends on, and then apply a
│ second time to fully converge.
╵
ERRO[0001] Terraform invocation failed in /Users/srinivas/Documents/repos/vpc 
ERRO[0001] 1 error occurred:
	* exit status 1

```

#### Route Table association for Private Subnets needs to be a separate module (Reason Why)

```
locals {
    routes                = [for val in aws_route_table.private : val.id]
  subnet_priv_ids       = [for k, v in local.private_subnet_ids : v.subnet_id]
  priv_subnet_route_map = zipmap(local.subnet_priv_ids, local.routes)

}
resource "aws_route_table_association" "private_subnets" {
  for_each       = local.priv_subnet_route_map
  subnet_id      = each.key
  route_table_id = each.value
}

```
#### Error at `terragrunt apply`

```
│ Error: Invalid for_each argument
│ 
│   on modules/vpc/vpc.tf line 59, in resource "aws_route_table_association" "private_subnets":
│   59:   for_each       = local.priv_subnet_route_map
│     ├────────────────
│     │ local.priv_subnet_route_map will be known only after apply
│ 
│ The "for_each" map includes keys derived from resource attributes that
│ cannot be determined until apply, and so Terraform cannot determine the
│ full set of keys that will identify the instances of this resource.
│ 
│ When working with unknown values in for_each, it's better to define the map
│ keys statically in your configuration and place apply-time results only in
│ the map values.
│ 
│ Alternatively, you could use the -target planning option to first apply
│ only the resources that the for_each value depends on, and then apply a
│ second time to fully converge.
╵
ERRO[0001] Terraform invocation failed in /Users/srinivas/Documents/repos/vpc 
ERRO[0001] 1 error occurred:
	* exit status 1
```
