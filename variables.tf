variable "cidr_block" {
  type        = string
  description = "VPC CIDR block"
}
variable "enable_dns_support" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable DNS support in the VPC."
}
variable "enable_dns_hostnames" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}
variable "tags" {
  type        = map(string)
  description = "VPC Tags"
}
variable "subnets" {
  type        = list(object({
    name     = string
    new_bits = number
  }))
  description = "Subnet information for tagging purposes and newbits to pass to cidr_subnets function"
}
