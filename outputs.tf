output "kms_arn" {
  value = aws_kms_key.tokyo_kms_key.key_id
}