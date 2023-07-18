resource "aws_instance" "my-library-ec2" {
  ami                    = "ami-03f65b8614a860c29"
  instance_type          = "t2.micro"
  key_name               = "connect2"
  subnet_id              = "subnet-0476219299fcdf93f"
  vpc_security_group_ids = ["sg-0afca0cdb0d87a189"]

  tags = {
    Name = "ec2-my-library-terraform"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/caiom/Desktop/connect2.pem")
      host        = self.public_ip
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker.io",
      "sudo usermod -aG docker ubuntu",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "aws configure set aws_access_key_id AKIAQIUHP3EKHP2LNKKF",
      "aws configure set aws_secret_access_key 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",
      "aws ecr get-login-password --region ${var.aws_region} | sudo docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.us-west-2.amazonaws.com",
      "sudo docker pull ${var.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/my-library-ecr:latest",
      "sudo docker run -d -p 5000:5000 docker run -p 5000:5000 -d ${var.account_id}.dkr.ecr.us-west-2.amazonaws.com/my-library-ecr:latest"
    ]
  }
}