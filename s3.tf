resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name

  policy = file("policy.json")


  tags = merge(local.tags, {
    Name ="${var.project}-s3-${var.environment}"
  })
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }

  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }

  depends_on = [
    aws_s3_bucket.s3
  ]
}