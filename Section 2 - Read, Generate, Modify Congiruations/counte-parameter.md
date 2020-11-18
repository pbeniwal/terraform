## This snippet is from the Count and Count Index video.

### iam-count-parameter.tf

```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

variable "user_names" {
  type = list
  default = ["dev-user", "stage-user","prod-user"]
}

resource "aws_iam_user" "iam_users" {
  name = var.user_names[count.index]
  count = 3
  path = "/system/"
}
```
### count-paremeter.tf

```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}


resource "aws_instance" "ec2-instance" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = 3
}
```
