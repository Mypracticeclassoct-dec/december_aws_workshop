#!/bin/bash

## Creating tags to the ec2 instance we created
aws ec2 run-instances \
 --image-id ami-0574da719dca65348 \
 --instance-type t2.micro \
 --key-name pckey 
 for instance in $(aws ec2 describe-instances --instance-ids --query "Reservations[].Instances[].InstanceId" --output text)
 do 
  aws ec2 create-tags \
  --resources ${instance} \
  --tags "Key=Name,Value=Test1"
 done 