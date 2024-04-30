output "bucket_name" {
  description = "Bucket Name"
  value       = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
  description = "Bucket ARN"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_tags" {
  description = "Bucket Tags"
  value       = aws_s3_bucket.bucket.tags
}
