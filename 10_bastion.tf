resource "aws_key_pair" "bastion_key" {
  key_name   = var.key_name_bastion
  public_key = file("data/key_pair/mykey.pub")
}


resource "aws_instance" "bastion" {
  ami                    = var.instance_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.libero-sg-bastion.id]
  subnet_id              = aws_subnet.libero-public-subnet.id
    key_name                    = var.key_name_bastion
  private_ip                  = var.private_ip_bastion
  associate_public_ip_address = true
  get_password_data           = "true"
  tags = {
    Name = "MyBastion"
  }

}



