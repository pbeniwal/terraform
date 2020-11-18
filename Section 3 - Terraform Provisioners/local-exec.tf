resource "aws_instance" "myec2" {
   ami = "ami-04bf6dcdc9ab498ca"
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}
