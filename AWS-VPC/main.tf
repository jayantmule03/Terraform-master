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
#creating vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "my-vpc"
  }
}
#private subnet
resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    name= "private-subnet"
  }
}
#public subnet
resource "aws_subnet" "public-subnet" {
 cidr_block = "10.0.2.0/24"
 vpc_id = aws_vpc.my-vpc.id
 tags = {
   name="public-subnet"
 }
}
#internet geteway
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    name="my-igw"
  }
}
# routing table
resource "aws_route_table" "my-rt" {
   vpc_id = aws_vpc.my-vpc.id
   tags = {
     name=" my-rt"
   }
   route  {
    cidr_block ="0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
   }
}
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.my-rt.id
}