resource "aws_acm_certificate" "cert" {
  provider          = aws.acm
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider                = aws.acm
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = aws_acm_certificate.cert.domain_validation_options.*.resource_record_name

  depends_on = [aws_acm_certificate.cert]
}