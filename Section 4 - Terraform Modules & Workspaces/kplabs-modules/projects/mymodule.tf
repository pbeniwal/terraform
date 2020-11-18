provider "aws" {
  region     = "us-east-1"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

module "ec2module"{
    source = "../module/ec2"
    instance_type = "t2.large"
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-04bf6dcdc9ab498ca"
  instance_type          = "t2.micro"
  key_name               = "aws"
  subnet_id              = "subnet-ecf62fcd"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
