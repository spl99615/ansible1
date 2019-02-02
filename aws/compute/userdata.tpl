#!/bin/bash -xe
yum update -y
aws s3 cp s3://surya-terraform-tfstate-1982/docker-test.env
internal_ip=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4/)
