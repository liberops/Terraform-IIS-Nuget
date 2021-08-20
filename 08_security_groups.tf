resource "aws_security_group" "libero-sg-IIS-nuget" {
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.libero-vpc.id


  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # RDP access from anywhere.
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.2.100/32"]
  }

  # HTTP access from anywhere.
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.2.0/24","10.0.3.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyIISNugetSG"
  }

}


resource "aws_security_group" "libero-sg-bastion" {
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.libero-vpc.id


  # RDP access from anywhere.
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["/32","/32"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.3.0/24"]
  }

  tags = {
    Name = "MyBastionSG"
  }
}


resource "aws_security_group" "libero-sg-fleet" {
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.libero-vpc.id


  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.2.100/32","10.0.3.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyFleetSG"
  }

}

