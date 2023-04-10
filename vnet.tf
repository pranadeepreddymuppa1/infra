resource "aws_vpc" "vpc" {
  cidr_block = local.cidr

  tags = {
    Name = "${var.project}-vpc-${var.environment}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_sub
  availability_zone = "us-east-1d"

  tags = {
    Name = "${var.project}-publicsubnet-${var.environment}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_sub2
  availability_zone = "us-east-1d"

  tags = {
    Name ="${var.project}-privatesubnet-${var.environment}"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name ="${var.project}-igw-${var.environment}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.some_custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.some_ig.id
  }

  tags = merge(local.tags, {
    Name ="${var.project}-rt-${var.environment}"
  })
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}