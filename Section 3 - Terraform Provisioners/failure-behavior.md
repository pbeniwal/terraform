### Important Note:

Make sure to have the aws.pem file present in the working directory for the provisioner to be able to connect to the instance.

### Demo Code Used During Demo:
```sh
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
   ami = "ami-04bf6dcdc9ab498ca"
   instance_type = "t2.micro"
   key_name = "aws"
   vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

   provisioner "remote-exec" {
     on_failure = continue
     inline = [
       "sudo yum -y install nano"
     ]
   }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./ec2-key.pem")
     host = self.public_ip
   }
}
```
