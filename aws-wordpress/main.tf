module "vpc" {
  source                    = "./modules/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  subnet_cidr_block         = var.subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
}

module "ec2" {
  source        = "./modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  key_name      = var.key_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
}


#module "s3" {
#  source = "./modules/s3"
#}

