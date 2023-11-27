terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.2.0"
    }
  }
}
#To create KMS resource 
resource "aws_kms_key" "tokyo_kms_key" {
  description             = "KMS key for Tokyo"
  deletion_window_in_days = 10
  key_usage               = "ENCRYPT_DECRYPT"
  enable_key_rotation     = true
  tags = {
    Name = "tokyo_kms_key"    
  }
}
#To create KMS Alias
resource "aws_kms_alias" "tokyo_kms_key_alias" {
  name          = "alias/cloud-watch-test"
  target_key_id = aws_kms_key.tokyo_kms_key.key_id
}

#To create KMS Policy 
/*resource "aws_kms_key_policy" "tokyo_kms_key_policy" {
  key_id = aws_kms_key.tokyo_kms_key.arn
  policy = jsonencode({
    "Version" = "2012-10-17"
    "Id" = "KMS policy"
    "Statement" = [
     {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::515149434592:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "logs.ap-northeast-1.amazonaws.com"
            },
            "Action": [
                "kms:Encrypt*",
                "kms:Decrypt*",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:Describe*"
            ],
            "Resource": "*",
            "Condition": {
                "ArnLike": {
                    "kms:EncryptionContext:aws:logs:arn": "arn:aws:logs:ap-northeast-1:515149434592:*"
                }
            }
        }    
    ]
   
  })
}*/