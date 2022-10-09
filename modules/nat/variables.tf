variable "tags" {
  type        = map(string)
  description = "VPC Tags"
}
variable "eip_map" {
  type        = map
  description = "Elastic IP address information with subnet mapping"
}
