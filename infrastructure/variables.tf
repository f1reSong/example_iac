variable "region" {
  type = string
  default = "us-east-1"
}

variable "region_2" {
  type = string
  default = "us-east-2"
}

variable "vpc_name_1" {
  type = string
  default = "just-vpc-1"
}

variable "vpc_name_2" {
  type = string
  default = "just-vpc-2"
}

variable "cidr_1" {
  type = string
  default = "10.10.0.0/16"
}

variable "cidr_2" {
  type = string
  default = "10.20.0.0/16"
}