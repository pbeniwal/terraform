provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
resource "aws_instance" "myec2" {
   ami = "ami-04bf6dcdc9ab498ca"
   instance_type = "t2.micro"
   key_name = "aws"

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./aws.pem")
     host = self.public_ip
   }
   }
}
