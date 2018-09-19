#################
# Security groups
#################
resource "aws_security_group" "allow_ssh_http_https" {
  name        = "allow_ssh_http_https"
  description = "Allow traffic for ports 22, 80 and 443"
  vpc_id      = "${var.vpc_id}"
}

#################
# Security group rules
#################
resource "aws_security_group_rule" "ingress_allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.allow_ssh_http_https.id}"
}

resource "aws_security_group_rule" "ingress_allow_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.allow_ssh_http_https.id}"
}

resource "aws_security_group_rule" "ingress_allow_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.allow_ssh_http_https.id}"
}

resource "aws_security_group_rule" "egress_allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.allow_ssh_http_https.id}"
}
