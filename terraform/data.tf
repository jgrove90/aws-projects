data "aws_cloudfront_distribution" "s3_distribution" {
  id = aws_cloudfront_distribution.s3_distribution.id
}

data "aws_caller_identity" "current" {}
