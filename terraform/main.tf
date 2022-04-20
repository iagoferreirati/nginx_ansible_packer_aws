data "aws_ami" "ami_via_cep" {
  most_recent = true
  owners      = ["self"]
  tags = {
    Name = "nginx_api_cep_packer"
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ami_via_cep.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_http.id]
  tags = {
    Name = "api_via_cep"
  }
}

