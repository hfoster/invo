resource "aws_cloudfront_distribution" "invo-cloudfront" {
  origin {
    domain_name = aws_route53_record.www.fqdn
    origin_id   = aws_eks_cluster.cluster.name
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET"]
    target_origin_id       = aws_eks_cluster.cluster.name
    viewer_protocol_policy = "https-only"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "GB", "DE", "JP", "IN"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  enabled = true
}
