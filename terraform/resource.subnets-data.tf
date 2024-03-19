# resource "aws_subnet" "data" {
#   count                   = local.num_azs
#   vpc_id                  = aws_vpc.invo_vpc.id
#   cidr_block              = cidrsubnet(aws_vpc.invo_vpc.cidr_block, 8, (count.index + 6))
#   map_public_ip_on_launch = false
#   availability_zone       = data.aws_availability_zones.available.names[count.index]
# }
