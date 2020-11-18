provider "aws" {
  region     = "us-east-1"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

module "ec2module"{
    source = "./module/ec2"
    instance_type = "t2.large"
}
