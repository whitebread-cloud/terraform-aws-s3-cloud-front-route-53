data "aws_route53_zone" "quotes" {
  name = var.route_53_zone_name
}

resource "aws_route53_record" "quotes_zone_apex_cdn_alias" {
  zone_id = data.aws_route53_zone.quotes.id

  name = var.hostname
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.web.domain_name
    zone_id                = aws_cloudfront_distribution.web.hosted_zone_id
    evaluate_target_health = false
  }
}
