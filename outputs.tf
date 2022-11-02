output "vpc_arn" {
  value       = module.vpc.vpc_arn
  description = "Amazon Resource Name (ARN) of VPC"
}
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}
output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "Map of Private Subnet and associated subnet id created.`private_subnet_ids = {\"Web or Data Subnet 1\" = { \"subnet_id\" = \"subnet-xxxxxxx\"}`"
}
output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "Map of Public Subnet and associated subnet id created.`public_subnet_ids = {\"Public Subnet 1\" = { \"subnet_id\" = \"subnet-xxxxxxx\"}`"
}
output "subnets" {
  value       = module.vpc.subnets
  description = "CIDR information associated with each subnet."
}
output "public_route_table" {
  value       = module.routes.public_route_table
  description = "Public Route Table ID."
}
output "private_route_tables" {
  value       = module.routes.private_route_tables
  description = "Private Route Table IDs."
}
output "public_route" {
  value       = module.routes.public_route
  description = "Public Route ID - Traffic to Internet Gateway"
}

output "eip" {
  value       = module.eip.eip
  description = "Elastic IP address information"
}
output "eip_map" {
  value       = module.eip.eip_map
  description = "Elastic IP address information with subnet mapping"
}
output "nat_gw" {
  value       = module.nat.nat_gw
  description = "NAT Gateway information with the Subnet and EIP allocation ID."
}
output "igw" {
  value       = module.igw.igw
  description = "Internet Gateway Information."
}
output "nat1" {
  value = module.routes.nat1
}
