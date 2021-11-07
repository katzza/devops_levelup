#create variable for loop
variable "vm" {
  description = "list vm by project"
  type = list(string)
  default = ["sender", "receiver"]
}

#create SSH-key
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"        #create "myKey" to AWS
  public_key = tls_private_key.pk.public_key_openssh
  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > key.pem" #create myKey.pem
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu-loop" {
  #loop
  for_each = toset(var.vm)
  ami             = data.aws_ami.ubuntu.id    #us-west-2   image got from filters
  key_name        = aws_key_pair.kp.key_name
  instance_type   = "t2.micro"

  tags = {
    Name = each.value
  }




}