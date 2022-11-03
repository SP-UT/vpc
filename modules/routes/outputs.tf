output "public_route_table" {
  value       = aws_route_table.public.id
  description = "Public Route Table ID."
}
output "public_route" {
  value       = aws_route.public_routes.id
  description = "Public Route ID - sending traffic to Internet Gateway"
}
output "route_table_az1" {
  value       = aws_route_table.az1.id
  description = "Private Route Table ID - AZ1"
}
output "route_table_az2" {
  value       = aws_route_table.az2.id
  description = "Private Route Table ID - AZ2"
}
output "route_table_az3" {
  value       = aws_route_table.az3.id
  description = "Private Route Table ID - AZ3"
}
