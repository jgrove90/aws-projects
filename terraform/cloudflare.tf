resource "cloudflare_record" "cert_validation" {
  zone_id = var.cloudflare_zone_id
  name    = replace(tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name, ".${var.cloudflare_domain_name}", "")
  value   = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value
  type    = "CNAME"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "cloudfront_cname" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_domain_name
  value   = data.aws_cloudfront_distribution.s3_distribution.domain_name
  type    = "CNAME"
  ttl     = 1
  proxied = false
}