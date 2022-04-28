variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"
}

variable "name" {
  description = "Name of the application"
  default     = "Instância Teste do Zay"
}

variable "env" {
  description = "Environment of the application"
  default     = "dev"
}

variable "ami" {
  description = "AWS AMI to be used"
  default     = "ami-04505e74c0741db8d"
}

variable "instance_type" {
  description = "Define the hardware configuration of the machine"
  default     = "t2.micro"
}