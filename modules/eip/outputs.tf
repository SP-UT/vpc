output "eip" {
  value = [
    for val in aws_eip.eip :
    val.public_ip
  ]
  description = "Elastic IP address information"
}
output "eip_map" {
  value       = local.eip_map
  description = "Elastic IP and corresponding subnet mapping"
}
