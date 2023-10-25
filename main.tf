terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }
}
#To create KMS resource 
resource "aws_kms_key" "tokyo_kms_key" {
  description             = "KMS key for Tokyo"
  deletion_window_in_days = 10
#  key_usage               = "ENCRYPT_DECRYPT"
#  enable_key_rotation     = true
}

#To create KMS Policy 
resource "aws_kms_key_policy" "tokyo_kms_key_policy" {
  key_id = aws_kms_key.tokyo_kms_key.arn
  policy = jsonencode({
    Id = "KMS policy"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::515149434592:user/satish_Terraform_poc"
        }

        Resource = "* "
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}