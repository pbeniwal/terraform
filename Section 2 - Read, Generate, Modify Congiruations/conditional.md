## This snippet is from the Conditional Expression Video.

### conditional.tf

```sh

provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-09e7aedfda734b173"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-09e7aedfda734b173"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}
```

### terraform.tfvars

```sh
istest = false
```
