resource "aws_subnet" "libero-subnet" {
  vpc_id     = aws_vpc.libero-vpc.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "MyPrivateSubnet"
  }
}
