provider "aws" {
    region = "ap-south-1"
    version = "~> 3.73.0"    
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}
data "aws_availability_zones" "azs" {
    state = "available"
}
