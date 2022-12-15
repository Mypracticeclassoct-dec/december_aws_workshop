#!/bin/bash
for region in $(aws ec2 describe-regions --query Regions[].RegionName --output text)
do
# To fetch all the active regions 
#region_vpc=$(aws ec2 describe-regions --query Regions[].RegionName --output text)
# TO fetch the vpc from region 
 aws ec2 describe-vpcs --query Vpcs[].IsDefault --output text --region $region
 done

 ## complete the following exercise