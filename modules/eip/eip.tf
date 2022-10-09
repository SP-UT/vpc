locals {
  eips           = [for val in aws_eip.eip : val.id]
  subnet_pub_ids = [for k, v in var.public_subnet_ids : v.subnet_id]
  eip_map        = zipmap(local.subnet_pub_ids, local.eips)

}
resource "aws_eip" "eip" {
  count = length(var.public_subnet_ids)
  vpc   = true
  tags  = merge({ "Name" = "Elastic IP - ${count.index}" }, var.tags)
}
