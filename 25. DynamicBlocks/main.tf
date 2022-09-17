resource "aws_instance" "linuxInstance" {
  ami                         = "ami-05fa00d4c63e32376"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  tags = {
    "Name" = "TFInstance"
  }
  key_name               = aws_key_pair.keypair.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
  connection {
    type        = "ssh"
    private_key = file("C:/Users/harik/.ssh/id_rsa")
    user        = "ec2-user"
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    script = "./user_data.sh"
  }
}

resource "aws_key_pair" "keypair" {
  public_key = file("C:/Users/harik/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH"
  vpc_id      = "vpc-e37c839e"
  dynamic "ingress" {
    for_each = var.ingressRules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}