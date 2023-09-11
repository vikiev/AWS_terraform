terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
} 

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAZCPKNG77QS6UXJMN"
  secret_key = "2AJWHXBZQuOhhLkp8yft+Vwnp5PAeuI73A4DvEad"
}

# Create a VPC
resource "aws_vpc" "example"{
cidr_block = "10.100.0.0/16"
tags ={
  Name = "AWS-Side"
}
}

resource "aws_subnet" "Subnet1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.100.0.0/24"
  map_public_ip_on_launch = "1"
}


resource "aws_vpc" "example2"{
  cidr_block = "10.200.0.0/16"
tags = {
  Name = "Customer-Side"
}
}


resource "aws_subnet" "Subnet2" {
  vpc_id     = aws_vpc.example2.id
  cidr_block = "10.200.0.0/24"
  map_public_ip_on_launch = "1"
}
