# Credentials are set by environment variables
provider "aws" {
    region = "${var.region}"
}