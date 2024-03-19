resource "aws_route_table" "private" {
  count  = local.num_azs
  vpc_id = aws_vpc.invo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.*.id[count.index]
  }
}

resource "aws_route_table_association" "compute" {
  count          = local.num_azs
  subnet_id      = aws_subnet.compute.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]
}

# resource "aws_route_table_association" "data" {
#   count          = local.num_azs
#   subnet_id      = aws_subnet.data.*.id[count.index]
#   route_table_id = aws_route_table.private.*.id[count.index]
# }
