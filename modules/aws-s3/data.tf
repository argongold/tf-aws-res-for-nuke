data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "ForceSSL"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }

  statement {
    sid    = "DenyNonSSEPuts"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:Put*"]
    resources = ["${aws_s3_bucket.this.arn}/*"]
    condition {
      test     = "Null"
      variable = "s3:x-amz-server-side-encryption"
      values   = ["true"]
    }
  }

  statement {
    sid    = "DenyNonRESTHeaderAuth"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]
    condition {
      test     = "StringNotEquals"
      variable = "s3:authType"
      values   = ["REST-HEADER"]
    }
  }

  statement {
    sid    = "DenyAnonymousNoPrincipalType"
    effect = "Deny"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*"
    ]
    condition {
      test     = "Null"
      variable = "aws:principaltype"
      values   = ["true"]
    }
  }

  statement {
    sid    = "DenyAnonymousPrincipalType"
    effect = "Deny"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*"
    ]
    condition {
      test     = "StringLike"
      variable = "aws:principaltype"
      values   = ["Anonymous"]
    }
  }
}
