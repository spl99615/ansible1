variable "ami" {
    description = "AMI"
}

variable "nameofservice" {
    description = "The tag name associated with this EC2 instances."
}

variable "keyname" {
    description = "Name of an existing EC2 KeyPair to enable SSH access into the server"
}