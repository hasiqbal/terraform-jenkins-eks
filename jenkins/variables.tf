variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnet" {
  type        = list(string)
  description = "public subnets"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "ami" {
  description = "ami type"
  type        = string
}
