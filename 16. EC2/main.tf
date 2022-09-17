resource "aws_instance" "linuxInstance" {
  ami                         = var.ami_id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  user_data                   = <<EOF
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
    systemctl enable nginx
    systemctl start nginx
  EOF
  tags = {
    "Name" = "TFInstance"
  }
  key_name               = aws_key_pair.keypair.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_key_pair" "keypair" {
  public_key = file("C:/Users/harik/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}