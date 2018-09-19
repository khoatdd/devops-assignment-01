module "base_infra" {
  source = "./modules/base_infra"
  region = "${var.region}"
}

module "python_dev_ec2" {
  source           = "./modules/python_dev_ec2"
  region           = "${var.region}"
  vpc_id           = "${module.base_infra.vpc_id}"
  subnet_id        = "${module.base_infra.public_subnet_id}"
  instance_type    = "${var.instance_type}"
  public_key_path  = "${var.public_key_path}"
  volume_size      = "${var.volume_size}"
  private_key_path = "${var.private_key_path}"
}
