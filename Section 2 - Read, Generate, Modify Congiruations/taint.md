
### taint.tf
```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}
```

### Taint Command
```sh
terraform taint aws_instance.myec2
```
