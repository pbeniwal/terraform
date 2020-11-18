## This snippet is from the Terraform Function video.

### functions.tf

```sh
provider "aws" {
  region     = var.region
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-04bf6dcdc9ab498ca"
    "us-west-2" = "ami-07a0da1997b55b23e"
    "ap-south-1" = "ami-026669ec456129a70"
  }
}

/*resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}*/

resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   //key_name = aws_key_pair.loginkey.key_name
   key_name = "aws"
   count = 2

   tags = {
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}
```
