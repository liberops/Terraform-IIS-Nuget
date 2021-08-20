resource "aws_key_pair" "IIS_nuget_key" {
  key_name   = var.key_name_IIS_nuget
  public_key = file("data/key_pair/mykey.pub")
}


data "template_file" "user_data" {
  template = file("user_data.txt")
  vars = {
    admin    = var.admin
    password = var.password
    bucket_name = var.bucket_name
    sources_zip = var.sources_zip
    sources_folder = var.sources_folder
    IIS_Nuget_Ready = var.IIS_Nuget_Ready
  }
}



resource "aws_instance" "IIS_nuget" {
  ami                         = var.instance_name
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.libero-sg-IIS-nuget.id]
  subnet_id                   = aws_subnet.libero-subnet.id
  key_name                    = var.key_name_IIS_nuget
  private_ip                  = var.private_ip_IIS_nuget
  associate_public_ip_address = false
  get_password_data           = "true"
  iam_instance_profile        = aws_iam_instance_profile.ec2_s3_profile.name
  user_data                   = data.template_file.user_data.rendered
  depends_on                  = [aws_s3_bucket_object.IIS_nuget]
  tags = {
    Name = "MyIIS_Nuget"
  }
}

