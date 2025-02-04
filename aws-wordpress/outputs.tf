output "ec2_instance_ip" {
  description = "The public IP of the EC2 instance"
  value = module.ec2.wordpress_public_ip
}

