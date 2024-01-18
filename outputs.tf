output "backup_bucket" {
  description = "Nome do Bucket"
  value = aws_s3_bucket.backups.bucket
}

output "backup_bucket_arn" {
  description = "ARN do bucket"
  value = aws_s3_bucket.backups.arn
}

output "backup_bucket_tags" {
  description = "Tags do bucket"
  value = aws_s3_bucket.backups.tags
}