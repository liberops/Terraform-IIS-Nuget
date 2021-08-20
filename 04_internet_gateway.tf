resource "aws_internet_gateway" "libero-igw" {
  vpc_id = aws_vpc.libero-vpc.id
  tags = {
    Name = "MyGateway"
  }
}