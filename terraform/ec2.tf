resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "my-library-ec2" {
  ami                         = "ami-03f65b8614a860c29"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ec2_key.key_name
  subnet_id                   = aws_subnet.my-library-subnet.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.enable-ssh-sg.id]

  tags = {
    Name = "ec2-my-library-terraform"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }

    inline = [
      "echo hello world"
      # "sudo apt update",
      # "sudo apt install -y docker.io",
      # "sudo usermod -aG docker ubuntu",
      # "sudo systemctl start docker",
      # "sudo systemctl enable docker",
      # "echo ${senha} | docker login --username meu_usuario --password-stdin",
      # "docker pull caiomoretti/my-library-image:latest"
    ]
  }
}