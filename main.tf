module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-terra-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "launctemplate" {
  source = "./modules/launchtemplate"

  image_id                    = "ami-053b0d53c279acc90" # ubuntu 22.04
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  delete_on_termination       = true
  tag_name                    = "Terraform-dev"
  disk_size                   = 10
  user_data                   = base64encode(templatefile("${path.module}/modules/launchtemplate/scripts/script.sh.tpl", {msg = "aa"}))
  vpc_id                      = module.vpc.vpc_id

}

module "asg" {
  source = "./modules/asg"

  subnets_id = module.vpc.public_subnets
  desired = 3
  max = 5
  min = 0
  template_id = module.launctemplate.launch_template_id
}