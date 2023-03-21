data "aws_caller_identity" "current" {}

data "aws_ami" "ami" {
  most_recent = true
  name_regex  =  "devops-practice-ansible"                                               # "Centos-8-DevOps-Practice"
  owners      =  [data.aws_caller_identity.current.account_id]  #["973714476881"]
}
