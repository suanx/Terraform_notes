provider "aws" {
    access_key = "add acces key"
    secret_key = "add secret key"
    region = "us-east-1"
  
}
resource "aws_vpc" "suanvpc" {
    tags = {
      Name = "mynewvps"
    }
    cidr_block = "10.0.0.0/16"
}
