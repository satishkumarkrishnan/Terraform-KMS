output "kms_arn" {
  value = aws_kms_key.ddsl_kms_key.arn
}

# output "s3_bucket_name" {
#  value = aws_s3_bucket.kms_encrypted.bucket
#}