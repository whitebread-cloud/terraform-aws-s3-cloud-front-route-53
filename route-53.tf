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

resource "aws_route53_record" "www_blizzard_quotes" {
  for_each = toset(var.alt_hostnames)
  zone_id = data.aws_route53_zone.quotes.id

  name    = each.key
  type    = "CNAME"

  ttl     = "5"
  records = [var.hostname]
}