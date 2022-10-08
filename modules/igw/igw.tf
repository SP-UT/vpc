resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id
  tags   = merge({ "Name" = join("-", [var.vpc_name, "IGW"]) }, var.tags)
}
