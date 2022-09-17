output "public_ip" {
  value       = aws_instance.linuxInstance.public_ip
  description = "Public IP of the Linux EC2 Instance"
}