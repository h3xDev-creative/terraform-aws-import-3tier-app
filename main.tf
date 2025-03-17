module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source       = "./modules/ec2"
  instance_id  = "i-dj239829ijh"  # Import existing EC2
  vpc_id       = module.vpc.vpc_id
  security_group_id = module.security_group.sg_id
}

module "rds" {
  source = "./modules/rds"
  db_instance_id = "your-db-instance-id"
}

module "lambda" {
  source = "./modules/lambda"
  function_name = "your-lambda-function"
}
