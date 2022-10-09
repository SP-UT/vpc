output "nat_gw" {
  value = {
    for val in aws_nat_gateway.nat_gw : val.subnet_id => {
      nat_id     = val.id
      allocation = val.allocation_id
    }
  }
  description = "NAT Gateway information with the Subnet and EIP allocation ID."
}
