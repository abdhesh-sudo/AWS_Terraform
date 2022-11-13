resource "null_resource" "nullremote" {

depends_on = [
  aws_volume_attachment.ebs_attach
]

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
      "sudo systemctl enable nginx",
      "sudo mkfs.ext4 /dev/xvdh",
      "sudo mount /dev/xvdc /var/www/html",
      "sudo apt-get install git -y",
      "sudo git clone https://github.com/vimallinuxworld13/gitphptest.git"
    ]
  }

}

