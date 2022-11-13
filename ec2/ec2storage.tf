provider "aws" {

region = "ap-south-1"
profile = "default"

}

resource "aws_instance" "OS1" {
ami = "ami-08df646e18b182346"
instance_type = "c5.large"
key_name = "instance"
tags = {
  Name = "my first Tf OS" }

}

output "this_is_instanace_id" {
 value = aws_instance.OS1.id
}

output "mypublicip" {
 value = aws_instance.OS1.public_ip
}


output "my_availablity_zone" {
 value = aws_instance.OS1.availability_zone
}

resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.OS1.availability_zone
  size              = 10

  tags = {
    Name = "LinuxWorld HD size"
  }
}

output "st1_volume_id"  {
 value = aws_ebs_volume.st1.id
}

# I am attachning current volume size is 10 GB

resource "aws_volume_attachment" "ebs_ett" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.st1.id 
  instance_id = aws_instance.OS1.id 
} 



