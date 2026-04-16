variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  
}

variable "env" {            
  description = "Environment name (e.g., dev, prod)"
  type        = string
  
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  
}