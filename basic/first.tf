provider "aws" {

region = "ap-south-1"
access_key = ""
secret_key = ""

}

resource "aws_instance" "OS1" {
ami = "ami-08df646e18b182346"
instance_type = "c5.large"
key_name = "abdhesh.thakur"
tags = {
  Name = "my first Tf OS"
}

}

