# Move values to variables

module "us-east-1" {
    source = "./modules/common_infra"
    region = "us-east-1"
    cidr = "10.22.0.0/16"
    public_subnets = ["10.22.0.0/24", "10.22.10.0/24"]
    private_subnets = ["10.22.20.0/24", "10.22.30.0/24"]
    database_subnets = ["10.22.40.0/24", "10.22.50.0/24"]
    azs = ["us-east-1a", "us-east-1b"]
    network_name = "my-vpc"
    tags = {
      "env" = "development"
    }
}

module "us-east-2" {
    source = "./modules/common_infra"
    region = "us-east-2"
    cidr = "10.32.0.0/16"
    public_subnets = ["10.32.0.0/24", "10.32.10.0/24"]
    private_subnets = ["10.32.20.0/24", "10.32.30.0/24"]
    database_subnets = ["10.32.40.0/24", "10.32.50.0/24"]
    azs = ["us-east-2a", "us-east-2b"]
    network_name = "my-vpc"
    tags = {
      "env" = "production"
    }
}