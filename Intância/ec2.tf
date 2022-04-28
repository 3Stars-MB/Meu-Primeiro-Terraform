resource "aws_instance" "teste1" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}