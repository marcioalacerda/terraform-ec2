data "aws_ami" "ubuntu" { //"data" coleta os dados de uma estrutura
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name        = var.name //campo dinâmico, será solicitado no provisionamneto
    Environment = var.env
    Provisioner = "Terraform" //campo estatico
    Repo        = var.repo
  }

}