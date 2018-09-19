variable "vpc_id" {
  description = "Specify the VPC to deploy EC2 instance into"
}

variable "subnet_id" {
  description = "Specify the subnet to deploy EC2 instance into"
}

variable "region" {
  description = "AWS region to deploy resources into"
  default = "us-east-2"
}

variable "public_key" {
  description = "Public key used to create AWS key pair"
}

variable "instance_type" {
  description = "Specify instance type for EC2 instance"
  default = "t2.micro"
}
