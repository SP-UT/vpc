variable "vpc_id" {
  type        = string
  description = "VPC ID"
}
variable "tags" {
  type        = map(string)
  description = "VPC Tags"
}
variable "private_subnet_ids" {
  type        = map(map(string))
  description = "VPC Private Subnet mapped to corresponding CIDRs."
}
variable "public_subnet_ids" {
  type        = map(map(string))
  description = "VPC Public Subnet mapped to corresponding CIDRs."
}
variable "igw" {
  type        = string
  description = "Internet Gaetway ID."
}
variable "route_az1_map" {
  type        = map(any)
  description = "Private Subnets and Public Subnet Mapping for Availability Zone 1."
}
variable "route_az2_map" {
  type        = map(any)
  description = "Private Subnets and Public Subnet Mapping for Availability Zone 2."
}
variable "route_az3_map" {
  type        = map(any)
  description = "Private Subnets and Public Subnet Mapping for Availability Zone 3."
}
