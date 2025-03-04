provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with your unique bucket name
}
