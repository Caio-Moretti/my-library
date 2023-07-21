resource "aws_security_group" "enable-ssh-sg" {
  name_prefix = "enable-ssh-sg-"
  description = "Security Group for EC2 with SSH access"

  vpc_id = aws_vpc.my-library-vpc.id

  ingress {
    description = "SSH from anywhere (IPv4)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH from anywhere (IPv6)"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description     = "All traffic from Security Group sg-076221306530858b1"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["sg-076221306530858b1"]
  }

  egress {
    description = "Outbound traffic (IPv4)"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Outbound traffic (IPv6)"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description     = "All traffic to Security Group sg-076221306530858b1"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["sg-076221306530858b1"]
  }

  tags = {
    Name = "enable-ssh-sg"
  }
}
