resource "aws_security_group" "alb" {
  vpc_id = aws_vpc.invo_vpc.id
  name   = "invo-alb-sg"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
}
