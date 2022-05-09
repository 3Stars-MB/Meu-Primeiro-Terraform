resource "aws_vpc" "test_vpc"{
    cidr_block = "10.0.0.0/16"
    enables_dns_hostnames = true

    tags = {
        Name = "VPC-Teste"
    }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.test_vpc.id 
  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
      Name = "igw-teste"
  }
}

resource "aws_route" "test-route" {
    vpc_id = aws_vpc.test_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.test-igw.id
    }

    tags = {
        Name = "rota-teste"
    }
}

resource "aws_route" "routetointernet" {
    route_table_id = aws_route_table.test-route.id 
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id  
}

resource "aws_route_table_association" "pub_subnet_association" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.test-route.id 
}