resource "aws_s3_bucket" "b" {
  bucket        = "terraform-test-adm"
  force_destroy = true
  tags = {
    Description = "Terraform Test"
    Name        = "terraform-test"
  }
}

resource "aws_s3_bucket_versioning" "versioning_terraform-test" {
  bucket = aws_s3_bucket.b.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_terraform-test" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}