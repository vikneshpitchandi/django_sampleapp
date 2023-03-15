provider "aws" {
  region     = "ap-southeast-1"
}

resource "aws_instance" "public_inst" {
   ami           = "ami-0f2eac25772cd4e36"
   instance_type = "t2.micro"
   key_name = "terraform_pvt_instance"
   associate_public_ip_address = true
   user_data = <<EOF
 #!/bin/bash
 sudo su
 yum install python3 -y
 yum install pip -y
 EOF
 }
