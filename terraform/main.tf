provider "aws" {
  access_key = "${var.acces_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

locals {
  conn_type    = "ssh"
  conn_user    = "ec2-user"
  conn_timeout = "1m"

  conn_key = "${file("~/OneDrive/Documentos/chave_aws/cka.pem")}"
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Acesso ao portal web"

  ingress {
    from_port   = 443
    to_port     = 443
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ip}/${var.mascara}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami             = "${var.ami}"
  instance_type   = "${var.type}"
  key_name        = "cka"
  tags            = "${var.tags}"
  security_groups = ["${aws_security_group.web.name}"]
}

output "ip" {
  value = "${aws_instance.web.public_ip}"
}
