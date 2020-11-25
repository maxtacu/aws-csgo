resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = var.tags
}

resource "aws_subnet" "csgo_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.vpc_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = var.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = var.tags
}

resource "aws_route_table" "internet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = var.tags
}

resource "aws_route_table_association" "internet" {
  subnet_id      = aws_subnet.csgo_subnet.id
  route_table_id = aws_route_table.internet.id
}