#################
# Get the most recent Amazon Ubuntu 16.06 AMI
#################
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-????????"]
  }

  owners = ["099720109477"]
}

#################
# EC2 instance
#################

resource "aws_instance" "python_dev" {
  count                  = "1"
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_http_https.id}"]
  subnet_id              = "${var.subnet_id}"
  key_name               = "${aws_key_pair.automation.key_name}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.volume_size}"
    delete_on_termination = true
  }

  tags {
    Name        = "python_dev"
    SSHusername = "ubuntu"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("${var.private_key_path}")}"
  }

  provisioner "remote-exec" {
    inline = [
      "export LC_ALL='en_US.UTF-8'",
      "export LC_CTYPE='en_US.UTF-8'",
      "sudo apt-get update",
      "sudo apt-get install -y nginx vim python-pip",
      "sudo pip install awscli uwsgi pipenv",
    ]
  }
}
