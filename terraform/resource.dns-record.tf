resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.personal.zone_id
  name    = "invo.hartnell.cc"
  type    = "A"

  alias {
    name                   = aws_lb.application.dns_name
    zone_id                = aws_lb.application.zone_id
    evaluate_target_health = true
  }
}
