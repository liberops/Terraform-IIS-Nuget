resource "aws_subnet" "libero-public-subnet" {
  vpc_id     = aws_vpc.libero-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "MyPublicSubnet"
  }
}