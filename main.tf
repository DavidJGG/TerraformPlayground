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

module "keyPair" {
  source = "./modules/keypair"

  tag_name  = "davidKey_1"
  file_name = "davidKeyTerraform.pub"
}

module "ec2_1" {
  source = "./modules/ec2"

  ami_id          = "ami-053b0d53c279acc90"
  subnet_id       = module.vpc.public_subnets[0]
  volume_size     = 10
  name            = "ec2-A"
  security_groups = [aws_security_group.sg_ec2_allow_ssh.id]

  key_name = module.keyPair.name

  instance_type = "t2.micro"

  depends_on = [aws_security_group.sg_ec2_allow_ssh]
} 

module "ec2_2" {
  source = "./modules/ec2"

  ami_id          = "ami-053b0d53c279acc90"
  subnet_id       = module.vpc.public_subnets[0]
  volume_size     = 10
  name            = "ec2-B"
  security_groups = [aws_security_group.sg_ec2_allow_ssh.id]

  key_name = module.keyPair.name

  instance_type = "t2.micro"

  depends_on = [aws_security_group.sg_ec2_allow_ssh]
} 

module "ec2_3" {
  source = "./modules/ec2"

  ami_id          = "ami-053b0d53c279acc90"
  subnet_id       = module.vpc.public_subnets[0]
  volume_size     = 10
  name            = "ec2-C"
  security_groups = [aws_security_group.sg_ec2_allow_ssh.id]

  key_name = module.keyPair.name

  instance_type = "t2.micro"

  depends_on = [aws_security_group.sg_ec2_allow_ssh]
} 

/*
module "launctemplate" {
  source = "./modules/launchtemplate"

  image_id                    = "ami-053b0d53c279acc90" # ubuntu 22.04
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  delete_on_termination       = true
  tag_name                    = "Terraform-dev"
  disk_size                   = 10
  user_data                   = base64encode(templatefile("${path.module}/modules/launchtemplate/scripts/script.sh.tpl", { msg = "aa" }))
  vpc_id                      = module.vpc.vpc_id
  key_pair_name               = module.keyPair.name
  security_groups             = [aws_security_group.sg_ec2_allow_ssh.id]

  depends_on = [aws_security_group.sg_ec2_allow_ssh]
}

module "asg" {
  source = "./modules/asg"

  subnets_id  = module.vpc.public_subnets
  desired     = 3
  max         = 5
  min         = 0
  template_id = module.launctemplate.launch_template_id
}
*/


resource "aws_security_group" "sg_ec2_allow_ssh" {
  name        = "Allow ssh trafic"
  description = "Allow SSH trafic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.tags, { Name = "sg_allow_ssh_ec2" })
}

locals {
  tags = {
    Owner = "David"
    ORG   = "aCloud"
    Type  = "Launch template component"
  }
}
