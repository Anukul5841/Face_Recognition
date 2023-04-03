provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_instance"  "task_6"  {
  ami           = "ami-0ad704c126371a549"
  instance_type = "t2.micro"
  availability_zone  = "ap-south-1a"

 tags = {
  Name = "Task6_OS"
 }
}

resource "aws_ebs_volume" "task6_vol" {
  availability_zone = "ap-south-1a"
  size              = 5

  tags = {
    Name = "Task6_vol"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.task6_vol.id
  instance_id = aws_instance.task_6.id
}
