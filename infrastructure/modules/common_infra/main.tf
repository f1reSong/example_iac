provider "aws" {
    region = var.region
}

module "network" {
    source = "./modules/network"
    name = var.network_name
    vpc_cidr = var.cidr
    vpc_tags = var.vpc_tags
    tags = var.tags
    public_subnets = var.public_subnets
    public_subnet_tags = var.public_subnet_tags
    private_subnets = var.private_subnets
    private_subnet_tags = var.private_subnet_tags
    database_subnets = var.database_subnets
    database_subnet_tags = var.database_subnet_tags
    azs = var.azs
}
