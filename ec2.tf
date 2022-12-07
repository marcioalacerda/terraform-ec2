resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = var.name //campo dinâmico, será solicitado no provisionamneto
    Environment = var.env
    Provisioner = "Terraform" //campo estatico
    Repo        = var.repo
  }

}