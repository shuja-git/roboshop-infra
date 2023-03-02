data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0f814c32290173c7c"]
  tags = {
    Name = "frontend"
  }

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }
    inline = [
     "git clone https://github.com/shuja-git/roboshop-shell",
      "cd roboshop-shell",
      "sudo bash ${var.component}.sh"
    ]
  }

}
resource "aws_security_group" "allow_tls" {
  name        = "${var.component}-${var.env}-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "ALL"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z10218511FGAD8YC6L1HI"
  name    = "${var.component}-dev.shujadevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

variable "component" {}
variable "env" {
  default = "dev"
}