output "public_web_server" {
    value = aws_instance.web-server.public_ip
}