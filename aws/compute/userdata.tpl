#!/bin/bash -xe
yum update -y
aws s3 cp s3://surya-terraform-state-1982/bootstrap.sh /home/ec2-user/
source /home/ec2-user/bootstrap.sh
