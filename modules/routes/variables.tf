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
