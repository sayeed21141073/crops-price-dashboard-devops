
provider "aws" {
  region = "us-east-1" 
}

# 2. S3 Bucket for Terraform State (Secure Storage)
resource "aws_s3_bucket" "terraform_state" {

  bucket = "my-s3-bucket-533267327324" 


  
  versioning {
    enabled = true # Keeps a history of your state file
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" # Encrypts the state file at rest
      }
    }
  }
}


resource "aws_s3_bucket_public_access_block" "public_access_block" {

  bucket = aws_s3_bucket.terraform_state.id 


  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_dynamodb_table" "terraform_locks" {
  # Unique name for the lock table
  name         = "terraform-lock-table-533267327324" 
  billing_mode = "PAY_PER_REQUEST" 
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


output "bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}
