resource "aws_lb" "application" {
  name               = "invo-lb-prod"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  security_groups    = [aws_security_group.alb.id]
}
