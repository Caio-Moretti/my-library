resource "aws_security_group" "enable-ssh-sg" {
  name_prefix = "enable-ssh-sg-"
  description = "Security Group for EC2 with SSH access"

  vpc_id = aws_vpc.my-library-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Run http server"
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Enable  SSh"
  }


  # Outboud Rule for SG
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "enable-ssh-sg"
  }
}
