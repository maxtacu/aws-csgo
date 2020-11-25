data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "csgo_server" {
  ami           = data.aws_ami.ubuntu.id
  key_name      = aws_key_pair.deployer.key_name
  instance_type = "t3.large"
  subnet_id = aws_subnet.csgo_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.csgo_server.id]

  root_block_device {
    volume_size = 100
  }

  tags = var.tags
}

resource "aws_key_pair" "deployer" {
  key_name   = "myawskey"
  public_key = file(var.pub_key_filepath)
}

output "csgoserver_instance_ip" {
  value = aws_instance.csgo_server.public_ip
}
