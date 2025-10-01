terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}


resource "aws_s3_bucket" "my-randomly-create-bucket" {   # resource type and terraform resource name
}

resource "aws_s3_object" "my-randomly-create-object" {
    bucket = aws_s3_bucket.my-randomly-create-bucket.id
    key = "myfile.txt"
    source = "myfile.txt"
    etag = filemd5("myfile.txt") # can distinguish if the file is changed
}