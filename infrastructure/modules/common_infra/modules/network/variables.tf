variable "name" {
  type = string
  default = "my-network"
}

variable "vpc_cidr" {
  type = string
  default = "10.10.0.0/16"
}

variable "tags" {
  default = {}
  type = map(string)
}

variable "vpc_tags" {
  default     = {}
  description = "Additional vpc tags"
  type        = map(string)
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnet_tags" {
  default     = {}
  description = "Additional public subnet tags"
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

variable "azs" {
  description = "A list of azs"
  type        = list(string)
  default     = []
}

variable "igw_tags" {
  default     = {}
  description = "Additional internet gateway tags"
  type        = map(string)
}

variable "public_route_table_tags" {
  default = {}
  description = "Additional routing table tags"
  type = map(string)
}

variable "private_route_table_tags" {
  default = {}
  description = "Additional routing table tags"
  type = map(string)
}

variable "database_route_table_tags" {
  default = {}
  description = "Additional routing table tags"
  type = map(string)
}

variable "nat_gateway_tags" {
  default     = {}
  description = "Additional nat gw tags"
  type        = map(string)
}

variable "nat_eip_tags" {
  default     = {}
  description = "Additional nat eip tags"
  type        = map(string)
}