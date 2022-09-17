output "publicip" {
    value = aws_instance.linuxInstance.public_ip
}