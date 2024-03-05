resource "aws_s3_bucket" "test_s3_bucket" {
  bucket = var.bucket

  tags = {
    Name        = var.s3_tags
    Environment = var.Environment
  }
}

resource "aws_s3_bucket_public_access_block" "test_bucket_public_access_block" {
  bucket = aws_s3_bucket.test_s3_bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_versioning" "test_s3_bucket_versioning" {
  bucket = aws_s3_bucket.test_s3_bucket.id
  versioning_configuration {
    status = var.versioning_configuration
  }
}