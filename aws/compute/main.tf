#-----------compute/main.tf-------
resource "aws_instance" "tf_ec2" {
  count = 3
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      = "${var.keyname}"
  vpc_security_group_ids = ["${aws_security_group.tf_ec2_sg.id}"]

  tags {
    Name = "${var.nameofservice}-${count.index + 1}"
  }
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
