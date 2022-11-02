output "public_route_table" {
  value       = aws_route_table.public.id
  description = "Public Route Table ID."
}
output "private_route_tables" {
  value = {
    for val in aws_route_table.private :
    val.tags.Name => val.id
  }
  description = "Private Route Table IDs."
}
output "public_route" {
  value = aws_route.public_routes.id
}
output "nat1" {
  value = values(var.route_az2_map)
}
