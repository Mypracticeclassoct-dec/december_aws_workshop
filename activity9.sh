#!/bin/bash

# fetching the information of the image ami-id
region=$1 # To pass the values during the run time 
default_region='us-east-1'
owner_id="309956199498"
name="RHEL-9.1.0_HVM-20221101-x86_64-2-Hourly2-GP2"
if [[ -z "${region}" ]]; then
echo "The refion is  not specified so we take the default region ${default_region}"
region=${default_region} 
fi
if [[ -n "${region}" ]]; then 
echo "The is region is specified ${region}"
fi
ami_id=$(aws ec2 describe-images \
--filters "Name=owner-id,Values=${owner_id}" "Name=name,Values=${name}" \
--query "Images[].ImageId" \
--output text)
echo "The ami_id of the rhel machine : ${ami_id}"
vpc_id=$(aws ec2 describe-vpcs --query "Vpcs[?IsDefault].VpcId | [0]" --output text --region "${region}")
echo "The vpc_id of default is ${vpc_id}"
subnet_id=$(aws ec2 describe-subnets --filters  "Name=vpc-id,Values=${vpc_id}" --query Subnets[].SubnetId --output text --region "${region}" )
echo "The subnet-id are ${subnet_id}"
security=$(aws ec2 describe-security-groups --filters  "Name=vpc-id,Values=${vpc_id}" --query SecurityGroups[].GroupId --output text --region "${region}")
echo "The security group_id: ${security}"