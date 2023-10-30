output "kms_arn" {
  value = aws_kms_key_policy.tokyo_kms_key_policy.key_id
}