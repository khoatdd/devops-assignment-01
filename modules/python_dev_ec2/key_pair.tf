#################
# AWS key pair
#################
resource "aws_key_pair" "automation" {
  key_name   = "automation-key"
  public_key = "${file("${var.public_key_path}")}"
}