resource "aws_s3_bucket" "bucket" {
  bucket        = "terraform-pipeline-jaime"
  force_destroy = true
  tags = {
    Description = "Terraform Pipeline Jaime"
    Name        = "terraform-pipeline-jaime"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
