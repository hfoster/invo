resource "aws_nat_gateway" "ngw" {
  count         = local.num_azs
  allocation_id = aws_eip.nat.*.id[count.index]
  subnet_id     = aws_subnet.public.*.id[count.index]
}
