output "bucket_name" {
  description = "Nome do Bucket"
  value       = aws_s3_bucket.b.bucket
}

output "bucket_arn" {
  description = "ARN do bucket"
  value       = aws_s3_bucket.b.arn
}

output "bucket_tags" {
  description = "Tags do bucket"
  value       = aws_s3_bucket.b.tags
}