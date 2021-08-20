variable "admin" {
  type        = string
  description = "compte administrateur du serveur"
  default     = "administrator"
}

variable "username" {
  type        = string
  description = "compte administrateur du serveur"
  default     = "liberovince"
}

variable "password" {
  type        = string
  description = "mot de passe administrator"
  default     = "Azerty31!"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}

variable "cidr_block" {
  description = "The CIDR block"
  default     = "10.0.0.0/16"
}

variable "instance_name" {
  type        = string
  description = "AMI used"
  default     = "ami-033500b90ed9aa25b"
}

variable "instance_type" {
  type        = string
  description = "The instance type used"
  default     = "t2.micro"
}

variable "private_ip_IIS_nuget" {
  description = "Private IP address IIS_nuget"
  default     = "10.0.3.100"
}

variable "private_ip_bastion" {
  description = "Private IP address bastion"
  default     = "10.0.2.100"
}

variable "bucket_name" {
  type        = string
  description = "The bucket name "
  default     = "libero-bucket"
}

variable "key_name_bastion" {
  type        = string
  description = "The key name "
  default     = "bastion_key"
}

variable "key_name_IIS_nuget" {
  type        = string
  description = "The key name "
  default     = "IIS_nuget_key"
}


variable "sources_zip" {
  type        = string
  description = "The sources ZIP folder in the Nuget Server "
  default     = "c:/ZIP"
}

variable "sources_folder" {
  type        = string
  description = "The sources BINARIES folder in the Nuget Server "
  default     = "c:/S3"
}


variable "IIS_Nuget_Ready" {
  type        = string
  description = "The IIS Nuget server status "
  default     = "Pending"
}
