## Activity-1:
---------------
* create and open a **.json** file in `https://jsoncrack.com/editor` website.
  * Pass the content using `aws ec2 describe-availability-zones > test.json` and open the test.json in jsoncrack.com website
## Activity-2 :
* Using `--query` to fetch data from a json file or output 
   1. ` aws ec2 describe-availability-zones --query "AvailabilityZones[0].ZoneId"` to get the specific value of the "objec" present in the "AvailabilityZones" which is a list[].
   2. ` aws ec2 describe-availability-zones --query "{IDs :AvailabilityZones[].ZoneId,Names :AvailabilityZones[].ZoneName}"` to filter all the zoneid and zonenames from all the objects present in the list.
   3. A filter projection allows you to filter the LHS of the projection before evaluating the RHS of a projection.
   `aws ec2 describe-availability-zones --query "AvailabilityZones[?ZoneId=='aps2-az1'].ZoneName | [0]"` here we filtered the "zonename" of a "zoneId" using the 'filter projection'.
## Activitu-3 :
* **Tagging and Filtering the resourses based on Tags**:
  * create tags :
     a. project =qtworkshop
     b. Env = test
     c. team =qtaws
     d. release =1.0

* creating an ec2 instance :
   aws ec2 run-instances `
    --image-id ami-0d8d9a2de1bcdb066 `
    --instance-type t3.micro `
    --key-name "mypckey"
------------
* To view all the active regions in user account : 
    aws ec2 describe-regions --query Regions[].RegionName --output text  