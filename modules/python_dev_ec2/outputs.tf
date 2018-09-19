output "ami_id" {
  value = "${data.aws_ami.ubuntu.id}"
}

output "instance_public_ip" {
  value = "${aws_instance.python_dev.public_ip}"
}