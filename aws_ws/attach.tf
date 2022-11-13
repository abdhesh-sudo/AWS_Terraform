resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.example.id
  instance_id = aws_instance.webos1.id
  force_detach = true
} 
