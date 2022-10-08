variable "vpc_name" {
  type        = string
  description = "VPC Name"
}
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}
variable "tags" {
  type        = map(string)
  description = "VPC Tags"
}
