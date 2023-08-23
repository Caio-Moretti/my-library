resource "aws_instance" "my-library-ec2" {
  ami                         = "ami-03f65b8614a860c29"
  instance_type               = "t2.micro"
  key_name                    = "ec2-public-key"
  subnet_id                   = aws_subnet.my-library-subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.enable-ssh-sg.id]
  monitoring                  = true

  tags = {
    Name = "My Library EC2 Instance from Terraform"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = var.private_key
      host        = self.public_ip
      timeout     = "3m"
    }

    inline = [
      "echo hello world",
      "sudo apt update",
      "sudo apt install -y docker.io",
      "sudo usermod -aG docker ubuntu && sudo chmod 666 /var/run/docker.sock",
      "sudo systemctl restart docker",
      "sudo systemctl enable docker",
      "echo ${var.docker_password} | docker login --username ${var.docker_username} --password-stdin",
      "docker pull caiomoretti/my-library-image:latest",
      "docker images",
      "docker run -d -p 5000:5000 caiomoretti/my-library-image:latest"
    ]
  }
}