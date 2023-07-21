resource "aws_vpc" "my-library-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "My Library VPC"
  }
}

resource "aws_subnet" "my-library-subnet" {
  vpc_id            = aws_vpc.my-library-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "My Library Subnet"
  }
}
