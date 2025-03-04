provider "aws" {
    region = "us-east-1"
  
}
 resource "aws_instance" "ec2-servere" {
    tags = {
        Name = "myinstance"

    }
   ami = ami-05b10e08d247fb927
   instance_type = "t2.micro"
   key_name = "nvriginia.pem"
   security_groups = [ "launch-wizard-1" ]
    }
