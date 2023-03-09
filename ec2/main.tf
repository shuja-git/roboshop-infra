data "aws_caller_identity" "current" {}

data "aws_ami" "ami" {
  most_recent = true
  name_regex  =  "devops-practice-ansible"                                               # "Centos-8-DevOps-Practice"
  owners      =  [data.aws_caller_identity.current.account_id]  #["973714476881"]
}

resource "aws_instance" "machine" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "${var.component}-${var.env}"
  }
 }

resource "null_resource" "provisioner" {
    depends_on = [aws_route53_record.record]
  provisioner "remote-exec" {

    connection {
      host = aws_instance.machine.public_ip
      user = "centos"
      password = "DevOps321"
    }
    inline = [
#      "git clone https://github.com/shuja-git/roboshop-shell",
#      "cd roboshop-shell",
#      "sudo bash ${var.component}.sh ${var.password}"
      "ansible-pull -i localhost, -U https://github.com/shuja-git/roboshop-ansible roboshop.yml -e role_name= ${var.component}"
    ]
  }

}

resource "aws_security_group" "sg" {
  name        =  "${var.component}-${var.env}-sg"
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
resource "aws_route53_record" "record" {
  zone_id = "Z10218511FGAD8YC6L1HI"
  name    = "${var.component}-dev.shujadevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.machine.private_ip]
}
