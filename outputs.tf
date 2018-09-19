output "vpc_id" {
  value = "${module.base_infra.vpc_id}"
}
output "ami_id" {
  value = "${module.python_dev_ec2.ami_id}"
}

output "python_dev_instance_public_ip" {
  value = "${module.python_dev_ec2.instance_public_ip}"
}

output "python_dev_instance_ssh_username" {
  value = "ubuntu"
}