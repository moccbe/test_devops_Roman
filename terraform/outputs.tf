output "instance_ip" {
  value = aws_instance.nginx_server.public_ip
}

output "dns_name" {
  value = "v${var.github_tag}.testte.pp.ua"
}