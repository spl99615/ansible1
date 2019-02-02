#!/bin/bash -xe
aws s3 cp s3://surya-terraform-state-1982/docker-test.env /home/ec2-user/
internal_ip=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4/)
sed -i s,internal_ip,$internal_ip,g /home/ec2-user/docker-test.env
