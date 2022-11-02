data "aws_nat_gateways" "public_subnet_1" {
  vpc_id = var.vpc_id

  filter {
    name   = "subnet-id"
    values = [keys(var.route_az1_map)[0]]
  }
}
data "aws_nat_gateways" "public_subnet_2" {
  vpc_id = var.vpc_id

  filter {
    name   = "subnet-id"
    values = [keys(var.route_az2_map)[0]]
  }
}
data "aws_nat_gateways" "public_subnet_3" {
  vpc_id = var.vpc_id

  filter {
    name   = "subnet-id"
    values = [keys(var.route_az3_map)[0]]
  }
}
