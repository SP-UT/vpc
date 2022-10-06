output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "Amazon Resource Name (ARN) of VPC"
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}
output "subnet_ids" {
    value = local.subnet_ids
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
