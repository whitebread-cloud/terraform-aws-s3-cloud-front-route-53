variable "bucket_name" {
  type        = string
  description = "Name of the bucket to be included in the policy"
}

data "aws_iam_policy_document" "s3_secure_transport_policy" {
  statement {
    sid       = "SecureTransport"
    effect    = "Deny"
    actions   = ["*"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*"]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

output "json" {
  value = data.aws_iam_policy_document.s3_secure_transport_policy.json
}

