provider "aws" {
  region = var.region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "nginx_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data = file("${path.module}/user_data.tpl")
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  tags = {
    Name = "Nginx-Server_v${var.github_tag}"
  }
}

resource "aws_security_group" "nginx_sg" {
  name        = "nginx_sg_${var.github_tag}"
  description = "Allow SSH, HTTP, and HTTPS"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_record" "nginx_record" {
  zone_id = var.route53_zone_id
  name    = "v${var.github_tag}.testte.pp.ua"
  type    = "A"
  ttl     = 300
  records = [aws_instance.nginx_server.public_ip]
}