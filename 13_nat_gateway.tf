resource "aws_eip" "libero-eip" {
  depends_on = [aws_internet_gateway.libero-igw]
}


resource "aws_nat_gateway" "libero-nat" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.libero-eip.id
  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.libero-public-subnet.id
  # A map of tags to assign to the resource.
  tags = {
    Name = "NAT"
  }
}