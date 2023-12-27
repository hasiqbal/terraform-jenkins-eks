
data "aws_ami" "latest_amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "platform-details"
    values = ["Linux/UNIX"]
  }
}

output "latest_ami_id" {
  value = data.aws_ami.latest_amazon_linux_2.id
}


data "aws_availability_zones" "azs" {}