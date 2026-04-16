resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  

  tags = {
    Name = "${var.env}-vpc"  #dev-vpc
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block
  tags = {
    Name = "${var.env}-subnet"  #dev-subnet
  }
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
  description = "the Subnet id where my ec2 is to be created"
}
