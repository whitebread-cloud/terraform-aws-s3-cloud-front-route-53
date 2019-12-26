module "secure_transport_policy_logs" {
  source      = "./modules/iam/secure-transport-policy"
  bucket_name = var.s3_logs_bucket
}

module "secure_transport_policy" {
  source      = "./modules/iam/secure-transport-policy"
  bucket_name = var.s3_web_bucket
}

data "aws_iam_policy_document" "web" {
  source_json = module.secure_transport_policy.json

  statement {
    sid       = "OriginAccessIdentityGet"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.web.iam_arn]
    }
  }

  statement {
    sid       = "OriginAccessIdentityList"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.web.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.web.iam_arn]
    }
  }
}
