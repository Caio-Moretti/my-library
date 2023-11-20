resource "aws_vpc" "my-library-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "My Library VPC - Terraform"
  }
}

resource "aws_internet_gateway" "my-library-igw" {
  vpc_id = aws_vpc.my-library-vpc.id

  tags = {
    Name = "My Library Internet Gateway"
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

resource "aws_route_table" "my-library-route-table" {
  vpc_id = aws_vpc.my-library-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-library-igw.id
  }
}

resource "aws_route_table_association" "my-library-subnet-association" {
  subnet_id      = aws_subnet.my-library-subnet.id
  route_table_id = aws_route_table.my-library-route-table.id
}
