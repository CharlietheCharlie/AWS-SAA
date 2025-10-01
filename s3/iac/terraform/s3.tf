

resource "aws_s3_bucket" "my-randomly-create-bucket" { 

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}