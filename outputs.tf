output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "Amazon Resource Name (ARN) of VPC"
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}
output "subnets" {
    value = local.subnets_with_cidr
}
