# terraform-aws-s3-cloud-front-route-53

## Summary

Terraform module for hosting a site using S3, CloudFront and
Route 53.

Requires that you have a Route 53 host zone and an ACM certificate
already available. Also requires a bucket for logging.

NOTE: Recommend using 
https://registry.terraform.io/modules/philips-software/cloudfront-s3/
over this module. This module was created for personal use
and before that module existed (this module was migrated to github).

Written using terraform .12.x

## Variables

See variables.tf

## Outputs

See outputs.tf

## Examples

### Basic Example

Example demonstrating the use of this module. Below are the bare
minimum variables necessary.

```
module "wc3_swagger" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.wc3_swagger_hostname
  route_53_zone_name  = local.blizzard_quotes_hostname
  acm_certificate_arn = aws_acm_certificate.wc3_quotes.arn
  s3_web_bucket       = local.wc3_swagger_bucket_name
  s3_logs_bucket      = local.s3_bucket_logs_name
}

```
