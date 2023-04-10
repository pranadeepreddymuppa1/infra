data "aws_ami" "app" {
  most_recent = true
 
  filter {
    name   = "state"
    values = ["available"]
  }
 
  filter {
    name   = "tag:Project"
    values = ["postpay-c2c"]
  }
 
}

resource "aws_instance" "web" {
  ami         = data.aws_ami.app
  instance_type = "t2.micro"
  for_each = var.ec2_names
  key_name = var.keyvaluepair

  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true


   root_block_device {
    volume_size = 8 # GB
    volume_type = "gp3"
  }

  tags =  {
    Name = each.key
  }
}

