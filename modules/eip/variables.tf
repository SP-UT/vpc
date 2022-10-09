variable "tags" {
  type        = map(string)
  description = "VPC Tags"
}
variable "public_subnet_ids" {
  type        = map(map(string))
  description = "VPC Public Subnet mapped to corresponding CIDRs."
}
