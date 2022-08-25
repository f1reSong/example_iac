# Example IaC templates in Terraform
This repository collect example IaC for building common infrastructure in AWS. 
## Structure:
```
  ├── Configuration
     └── Roles
  ├── Infrastructure
     └── Modules
         └── common_infra
             └── Modules
                 └── Other Modules
```
Root directory contains 2 subdirs, where we keep terraform and ansible code base(Ansible part not ready right now), in this example we will use ansible for pre-configuring new instances created by terraform and based on base AMI's
###### Ansible
Will be added after ansible part would be created
###### Terraform
As you see, main module contain nested modules for better code readability. Currently created network module can create vpc and n-number of subnets in different Availability Zones with internet gateway, nat gateway and routing tables. Currently code can not build more cheap infrastructure with single NAT gateway for all private subnets and will create NAT GW for every private subnet, also if we has more private subnets, than public, or than Availability zones. 
##### Pay attention
If you just found this repository from internet, Please remember: This code is a quick example and I recommend to use for your projects more complex and ready modules from terraform registry. This modules more flexible, provide more functionality and has support from community and/or maintainer, agains this code may be never update or supported in future.

## TO DO
```
Add checking number of AZ's and Private subnets
Add variable to setup a nat gw configuration(single/2(multi-az)/for every private subnet)
Add ACL and SG functionality
Add other modules(RDS, EC2, Lambda, etc)
Add remote backend optional configurations(S3, terraform cloud)
```
