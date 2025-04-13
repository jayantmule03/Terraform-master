terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "random_id" "rand-id" {
    byte_length = 8
  
}
resource "aws_s3_bucket" "demo" {
    bucket = "demo-bucket-${random_id.rand-id.hex}"
  
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.demo.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.demo.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.demo.arn}/*"
        }
      ]
    }
  )
}
resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.demo.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "htmlfile" {
  bucket = aws_s3_bucket.demo.bucket
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"
}
resource "aws_s3_object" "cssfile" {
  bucket = aws_s3_bucket.demo.bucket
  source = "./style.css"
  key = "style.css"
  content_type = "text/css"
}