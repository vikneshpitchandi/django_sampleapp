provider "aws" {
  region     = "ap-southeast-1"
}

variable "vpc_id" {default= ""}

data "aws_vpc" "default" {
  id = "${var.vpc_id}"
}

  resource "aws_security_group" "ec2_sg" {

    vpc_id      = "${data.aws_vpc.default.id}"

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
     cidr_blocks  = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
    }
      egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks  = ["0.0.0.0/0"]
    }
  }

resource "aws_instance" "public_inst" {
   ami           = "ami-0f2eac25772cd4e36"
   instance_type = "t2.micro"
   key_name = "terraform_pvt_instance"
   associate_public_ip_address = true
   vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
   user_data = <<EOF
 #!/bin/bash
 sudo su
 yum install python311 -y
 yum install python-pip -y
 EOF
 }
output "ec2_global_ips" {
  value = "${aws_instance.public_inst.public_ip}"
}
