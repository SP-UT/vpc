output "public_route_table" {
  value       = aws_route_table.public.id
  description = "Public Route Table ID."
}
#output "private_route_tables" {
#  value = {
#    for val in aws_route_table.private :
#    val.tags.Name => val.id
#  }
#  description = "Private Route Table IDs."
#}
output "public_route" {
  value = aws_route.public_routes.id
}
output "route_table_az1" {
  value = aws_route_table.az1.id
}
output "route_table_az2" {
  value = aws_route_table.az2.id
}
output "route_table_az3" {
  value = aws_route_table.az3.id
}
