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

variable "volume_size" {
  description = "Specify root volume size for EC2 instance"
  default = "12"
}

variable "private_key_path" {
  description = "Specify path to the private key used to ssh to EC2 instance"
}
