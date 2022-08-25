variable "region" {
  type = string
  default = "us-east-1"
}

variable "network_name" {
  type = string
  default = "my-network"
}

variable "cidr" {
  type = string
  default = "10.10.0.0/16"
}

variable "vpc_tags" {
  description = "Additional vpc tags"
  type        = map(string)
  default = {}
}

variable "tags" {
  default = {}
  type = map(string)
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "A list of azs"
  type        = list(string)
  default     = []
}

variable "public_subnet_tags" {
  default     = {}
  description = "Additional subnet tags"
  type        = map(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnet_tags" {
  default     = {}
  description = "Additional private subnet tags"
  type        = map(string)
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "database_subnet_tags" {
  default     = {}
  description = "Additional database subnet tags"
  type        = map(string)
}