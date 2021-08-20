resource "aws_route_table" "libero-rt_public" {
  vpc_id = aws_vpc.libero-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.libero-igw.id
  }
  tags = {
    Name = "MyPublic_Route_Table"
  }
}

resource "aws_route_table_association" "libero-rta_public" {
  subnet_id      = aws_subnet.libero-public-subnet.id
  route_table_id = aws_route_table.libero-rt_public.id
}


resource "aws_route_table" "libero-rt_private" {
  vpc_id = aws_vpc.libero-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.libero-nat.id
  }
  tags = {
    Name = "MyPrivate_Route_Table"
  }
}

resource "aws_route_table_association" "libero-rta_private" {
  subnet_id      = aws_subnet.libero-subnet.id
  route_table_id = aws_route_table.libero-rt_private.id
}
