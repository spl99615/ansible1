variable "region" {
    default = "us-east-1"
}
variable "ami" {
    type = "map"
    default = {
        "us-east-1" = "ami-009d6802948d06e52"
        "us-west-2" = "ami-01bbe152bf19d0289"
    }
}

variable "keyname" {}
variable "nameofservice" {
    default = "tf_ansible_test_servers"
}

variable "rolename" {
    default = "ec2-s3-full-role"
}