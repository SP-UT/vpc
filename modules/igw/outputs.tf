output "igw" {
  value = {
    join("-", [var.vpc_name, "IGW"]) = aws_internet_gateway.gw.id
  }
  description = "AWS Internet Gateway"
}
