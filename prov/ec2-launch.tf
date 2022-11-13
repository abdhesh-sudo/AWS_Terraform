provider "aws" {
 region = "ap-south-1"
 profile = "default"

}

resource "aws_instance" "webos1" {
  ami = "ami-05ba3a39a75be1ec4" 
  instance_type = "t2.micro"
  security_groups = [ "webserver-sg1" ]
  key_name = "abdhesh.thakur"
  tags = { 
    Name = "webserver_os"
 }

resource "null_resource" "nullr1" {

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("/home/abdhesh/secret/abdheshthakur.pem")
    host     = aws_instance.webos1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get upadate -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

}
}
