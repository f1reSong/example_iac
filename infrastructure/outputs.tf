output "vpc_id_us-east-1" {
  description = "The ID of the VPC"
  value       = module.us-east-1.vpc_id
}

output "vpc_arn_us-east-1" {
  description = "The ARN of the VPC"
  value       = module.us-east-1.vpc_arn
}

output "vpc_cidr_block_us-east-1" {
  description = "The CIDR block of the VPC"
  value       = module.us-east-1.vpc_cidr_block
}

output "public_subnets_us-east-1" {
  description = "List of IDs of public subnets"
  value       = module.us-east-1.public_subnets
}

output "public_subnet_arns_us-east-1" {
  description = "List of ARNs of public subnets"
  value       = module.us-east-1.public_subnet_arns
}

output "public_subnets_cidr_blocks_us-east-1" {
  description = "List of cidr_blocks of public subnets"
  value       = module.us-east-1.public_subnets_cidr_blocks
}

output "vpc_id_us-east-2" {
  description = "The ID of the VPC"
  value       = module.us-east-2.vpc_id
}

output "vpc_arn_us-east-2" {
  description = "The ARN of the VPC"
  value       = module.us-east-2.vpc_arn
}

output "vpc_cidr_block_us-east-2" {
  description = "The CIDR block of the VPC"
  value       = module.us-east-2.vpc_cidr_block
}

output "public_subnets_us-east-2" {
  description = "List of IDs of public subnets"
  value       = module.us-east-2.public_subnets
}

output "public_subnet_arns_us-east-2" {
  description = "List of ARNs of public subnets"
  value       = module.us-east-2.public_subnet_arns
}

output "public_subnets_cidr_blocks_us-east-2" {
  description = "List of cidr_blocks of public subnets"
  value       = module.us-east-2.public_subnets_cidr_blocks
}