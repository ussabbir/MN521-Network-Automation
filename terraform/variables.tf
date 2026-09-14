variable "aws_region" {
  description = "AWS region for the MN521 deployment"
  type        = string
  default     = "ap-southeast-2"
}

variable "owner_tag" {
  description = "Owner/group tag"
  type        = string
  default     = "MN521-Group-4"
}

variable "admin_cidr" {
  description = "Public IP CIDR allowed to SSH to the bastion"
  type        = string

  validation {
    condition     = var.admin_cidr != "0.0.0.0/0"
    error_message = "admin_cidr must not be 0.0.0.0/0"
  }
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnet internet access"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
