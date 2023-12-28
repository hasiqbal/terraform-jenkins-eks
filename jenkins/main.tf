#vpc

resource "aws_vpc" "vpc-jenkins" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "jenkins-vpc"
    Terraform   = "true"
    Environment = "dev"
  }
}

#sg

resource "aws_security_group" "sg_jenkins" {


  name        = "jenkins-sg"
  description = "Security Group for Jenkins Server"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "HTTP Jenkins server"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#ec2

resource "aws_instance" "jenkins_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Jenkins-server"
  monitoring                  = true
  associate_public_ip_address = true
  user_data                   = file("jenkins-install.sh")
  availability_zone           = data.aws_availability_zones.azs.names[0]
  vpc_security_group_ids      = [aws_security_group.sg_jenkins.id]


  tags = {
    Name        = "Jenkins-Server"
    Terraform   = "true"
    Environment = "dev"
  }
}

