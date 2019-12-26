resource "aws_s3_bucket" "web" {
  bucket = var.s3_web_bucket

  force_destroy = var.s3_force_destroy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  logging {
    target_bucket = var.s3_logs_bucket
    target_prefix = "s3-access-logs-${var.s3_web_bucket}/"
  }

  versioning {
    enabled = var.s3_versioning
  }

  tags = {
    Name    = var.s3_web_bucket
    Purpose = "Make ${var.hostname} available via CloudFront."
  }
}

resource "aws_s3_bucket_policy" "associate_policy" {
  bucket = aws_s3_bucket.web.id
  policy = data.aws_iam_policy_document.web.json
}
