#-----------compute/main.tf-------

data "template_file" "user-init" {
  template = "${file("${path.module}/userdata.tpl")}"
}

resource "aws_instance" "tf_ec2" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      = "${var.keyname}"
  vpc_security_group_ids = ["${aws_security_group.tf_ec2_sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.tf_instance_profile.id}"
  user_data = "${data.template_file.user-init.rendered}"
}

resource "aws_iam_instance_profile" "tf_instance_profile" {
  role = "${var.rolename}"
}

resource "aws_security_group" "tf_ec2_sg" {
  name = "${var.nameofservice}-public-sg"
  description = "Public access for HTTP and SSH"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
