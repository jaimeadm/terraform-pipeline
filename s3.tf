resource "aws_s3_bucket" "backups" {
  bucket = "backup-files-jaimeadm"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Description = "Bucket para armazenar backups"
    Data        = "18/01/2024"
    Owner       = "Alan M O Silva"
    CreatedBy   = "Terraform Jaimeadm"
  }
  lifecycle_rule {
    id      = "log"
    enabled = true
    prefix  = "log/"
    tags = {
      rule      = "log"
      autoclean = "true"
    }
    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
    expiration {
      days = 90
    }
  }
}