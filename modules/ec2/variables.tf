variable "ami_id" {                              
  description = "The ami id of the instance"    
  type = string
}

variable "instance_type" {                              
  description = "The type of the instance"    
  type = string 
  
}

variable "instance_count" {                              
  description = "Number of instances to create"    
  type = number 
  
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instances will be created"
  type = string
}

variable "env" {
    description = "Environment name (e.g., dev, prod)"
    type        = string
}