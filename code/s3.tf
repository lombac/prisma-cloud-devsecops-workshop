provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "80f67849-d3bb-40fd-8628-9a7db2e79f19"
    git_commit           = "846de530cf572aece41b44a54c410dca70737037"
    git_file             = "code/s3.tf"
    git_last_modified_at = "2024-12-12 14:09:20"
    git_last_modified_by = "christophe.lombard@gmail.com"
    git_modifiers        = "christophe.lombard"
    git_org              = "lombac"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls_21" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
