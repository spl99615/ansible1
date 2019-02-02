provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "surya-terraform-state-1982"
    key     = "terraform/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

module "tf_webservers" {
  source = "./compute"
  ami = "${lookup(var.ami,var.region)}"
  keyname = "${var.keyname}"
  nameofservice = "${var.nameofservice}"
  rolename = "${var.rolename}"
}
