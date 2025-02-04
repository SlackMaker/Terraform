output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID da Subnet pública"
  value       = aws_subnet.public_subnet.id  # Supondo que a subnet pública tenha esse nome
}

