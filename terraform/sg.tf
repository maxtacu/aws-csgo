resource "aws_security_group" "csgo_server" {
  name        = "csgo_server"
  description = "Allow CS:GO inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 27015
    to_port     = 27030
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27005
    to_port     = 27005
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27015
    to_port     = 27030
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
