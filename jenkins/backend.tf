terraform {
  backend "s3" {
    bucket = "eks-terraform-jenkins"
    key    = "jenkins/terraform.tfstate"
    region = "eu-west-1"
  }

}