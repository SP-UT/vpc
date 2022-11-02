output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "Amazon Resource Name (ARN) of VPC"
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}
output "private_subnet_ids" {
  value       = local.private_subnet_ids
  description = "Map of Private Subnet and associated subnet id created.`private_subnet_ids = {\"Web or Data Subnet 1\" = { \"subnet_id\" = \"subnet-xxxxxxx\"}`"
}
output "public_subnet_ids" {
  value       = local.public_subnet_ids
  description = "Map of Public Subnet and associated subnet id created.`public_subnet_ids = {\"Public Subnet 1\" = { \"subnet_id\" = \"subnet-xxxxxxx\"}`"
}
output "subnets" {
  value = {
    for val in aws_subnet.main :
    val.tags.Name => val.cidr_block
  }
  description = "CIDR information associated with each subnet."
}
output "az_1_private_subnets" {
  value       = local.az_1_private_subnets
  description = "Private Subnets in Availability Zone 1(Required by routes module)"
}
output "az_2_private_subnets" {
  value       = local.az_2_private_subnets
  description = "Private Subnets in Availability Zone 2(Required by routes module)"
}
output "az_3_private_subnets" {
  value       = local.az_3_private_subnets
  description = "Private Subnets in Availability Zone 3(Required by routes module)"
}
output "public_subnet_1" {
  value       = local.public_subnet_ids["Public Subnet 1"]["subnet_id"]
  description = "Public Subnet in Availability Zone 1(Required by routes module)"
}
output "public_subnet_2" {
  value       = local.public_subnet_ids["Public Subnet 2"]["subnet_id"]
  description = "Public Subnet in Availability Zone 2(Required by routes module)"
}
output "public_subnet_3" {
  value       = local.public_subnet_ids["Public Subnet 3"]["subnet_id"]
  description = "Public Subnet in Availability Zone 3(Required by routes module)"
}
