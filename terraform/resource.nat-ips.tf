resource "aws_eip" "nat" {
  count  = local.num_azs
  domain = "vpc"
}
