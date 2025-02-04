resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Allow HTTP, HTTPS, and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permite SSH de qualquer IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permite HTTP de qualquer IP
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permite HTTPS de qualquer IP
  }
}


# Regras de saída (Egress) - Configuração separada
resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.wordpress_sg.id
}

resource "aws_instance" "wordpress" {
  ami           = var.ami_id  		 # Usando a variável ami_id definida no terraform.tfvars
  instance_type = var.instance_type  # Usando a variável instance_type
  key_name      = var.key_name       # Usando a variável key_name
  subnet_id     = var.subnet_id      # Usando a variável subnet_id
  security_groups = [aws_security_group.wordpress_sg.id]  # Associando o security group

  tags = {
    Name = "wordpress-instance"
  }

  associate_public_ip_address = true
}

output "wordpress_public_ip" {
  description = "The public IP of the EC2 instance"
  value = aws_instance.wordpress.public_ip
}

