resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.invo_vpc.id
}
