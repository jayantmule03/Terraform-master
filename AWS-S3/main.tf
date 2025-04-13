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
resource "aws_s3_bucket" "main" {
    bucket = "my-bucket ${random_id.rand-id.hex}"
  
}
resource "aws_s3_object" "data" {
     bucket = aws_s3_bucket.main.bucket
    source = "./sample.txt"
    key = "sample.txt"  
}