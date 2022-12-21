#!/bin/bash
$sg = (aws ec2 create-security-group \
 --description "security group test" \
 --group-name "test sg" \
 --query "GroupId" \
 --region "us-east-1" \
 --output text)

aws ec2 authorize-security-group-ingress \
 --group-id $sg \
 --protocol "tcp" \
 --port "0-65535" \
 --cidr "0.0.0.0/0" \
 --region "us-east-1"