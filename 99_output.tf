output "instance_id_IIS_nuget" {
  description = "ID of the IIS Nuget"
  value       = aws_instance.IIS_nuget.id
}

output "instance_private_ip_IIS_nuget" {
  description = "Private IP address of the IIS Nuget"
  value       = aws_instance.IIS_nuget.private_ip
}


output "public_dns_IIS_nuget" {
  description = "Public DNS names assigned to the instanceIIS Nuget"
  value       = aws_instance.IIS_nuget.public_dns
}


output "Administrator_Password_IIS_nuget" {
  value = rsadecrypt(aws_instance.IIS_nuget.password_data, file("data/key_pair/mykey.pem"))
}


output "instance_id_bastion" {
  description = "ID of the bastion"
  value       = aws_instance.bastion.id
}

output "instance_private_ip_bastion" {
  description = "Private IP address of the bastion"
  value       = aws_instance.bastion.private_ip
}


output "Administrator_Password_bastion" {
  value = rsadecrypt(aws_instance.bastion.password_data, file("data/key_pair/mykey.pem"))
}

output "instance_public_ip_bastion" {
  description = "Public IP address of the bastion"
  value       = aws_instance.bastion.public_ip
}
