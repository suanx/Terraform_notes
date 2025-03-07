provider "aws" {
    region = "us-east-1"
    access_key = "accesskey"
    secret_key = "secretkey"
}

resource "aws_instance" "myinstance" {
  tags = {
    Name = "minik8sserver"
  }
  ami = "ami-05b10e08d247fb927"  # Amazon Linux 2023 AMI
  instance_type = "t2.medium"
  security_groups = ["default"]
  key_name = "nvriginia"
  
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 15
    delete_on_termination = true
  }
}

output "public_ip" {
  value = aws_instance.myinstance.public_ip
}
