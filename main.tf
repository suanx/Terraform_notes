# 1️⃣ Create VPC  
# 2️⃣ Create Subnet & Attach to VPC  
# 3️⃣ Create Internet Gateway & Attach to VPC  
# 4️⃣ Create Route Table & Attach to VPC  
# 5️⃣ Add Route to IGW in Route Table  
# 6️⃣ Associate Route Table with Subnet  


provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "vpc-sa" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "psub" {
    vpc_id     = aws_vpc.vpc-sa.id
    cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.vpc-sa.id
}

resource "aws_route_table" "myrtb" {
    vpc_id = aws_vpc.vpc-sa.id
}
resource "aws_route" "defr" {
    route_table_id = aws_route_table.myrtb.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id

}
resource "aws_route_table_association" "prtb" {
    route_table_id = aws_route_table.myrtb.id
    subnet_id      = aws_subnet.psub.id
}
