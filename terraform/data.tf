data "aws_availability_zones" "available" {}

data "aws_iam_policy_document" "eks-assume-role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_route53_zone" "personal" {
  name         = "hartnell.cc"
  private_zone = false
}
