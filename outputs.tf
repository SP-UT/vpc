output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "Amazon Resource Name (ARN) of VPC"
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}
output "private_subnet_ids" {
  value = local.private_subnet_ids
}
output "public_subnet_ids" {
  value = local.public_subnet_ids
  description = "Map of Public Subnet and associated subnet id created.`public_subnet_ids = {\"Public Subnet 1\" = { \"subnet_id\" = \"subnet-xxxxxxx\"}`"
}
output "subnets" {
  value = {
    for val in aws_subnet.main :
    val.tags.Name => val.cidr_block
  }
  description = "CIDR information associated with each subnet."
}

output "igw" {
  value = {
    join("-", [var.vpc_name, "IGW"]) = aws_internet_gateway.gw.id
  }
  description = "AWS Internet Gateway"
}

output "eip" {
  value = [
    for val in aws_eip.eip :
    val.public_ip
  ]
  description = "Elastic IP address information"
}
