data "aws_cloudfront_distribution" "s3_distribution" {
  id = aws_cloudfront_distribution.s3_distribution.id
}

data "aws_iam_policy_document" "s3_cloudfront_policy" {
  statement {

    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }
  }
}
