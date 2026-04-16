 module "vpc" {
   source = "../../modules/vpc"
   vpc_cidr_block = "10.0.0.0/16"
   subnet_cidr_block = "10.0.0.0/24"
   env = "dev"
 }

 module "ec2" {
   source = "../../modules/ec2"
   instance_type = "t3.small"
   ami_id = "ami-0e7ff22101b84bcff" # ubuntu AMI  
   subnet_id = module.vpc.subnet_id
   instance_count =   1
   env = "dev"
 }
