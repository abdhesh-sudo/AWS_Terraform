resource "aws_instance" "webos1" {
  ami = "ami-05ba3a39a75be1ec4" 
  instance_type = "t2.micro"
  security_groups = [ "webserver-sg1" ]
  key_name = "abdhesh.thakur"
  tags = { 
    Name = "webserver_os1"
 }
}
