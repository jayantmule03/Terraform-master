terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "main" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  tags = {
    name = "myserver"
  }
  
}