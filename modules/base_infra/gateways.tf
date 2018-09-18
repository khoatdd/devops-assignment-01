#################
# Internet gateway
#################
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "internet-gateway"
  }
}

#################
# NAT gateway
#################
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"

  tags {
    Name = "nat_gateway"
  }

  depends_on = ["aws_internet_gateway.igw"]
}