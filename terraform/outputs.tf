output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "availability_zones" {
  value = [
    aws_subnet.public[0].availability_zone,
    aws_subnet.public[1].availability_zone
  ]
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
}

output "app_private_ip" {
  value = aws_instance.app.private_ip
}

output "ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "security_group_ids" {
  value = {
    bastion = aws_security_group.bastion.id
    app     = aws_security_group.app.id
  }
}

output "ssh_to_bastion" {
  value = "ssh -i ./mn521-enterprise-key.pem ec2-user@${aws_instance.bastion.public_ip}"
}

output "ssh_to_app_via_bastion" {
  value = "ssh -i ./mn521-enterprise-key.pem -J ec2-user@${aws_instance.bastion.public_ip} ec2-user@${aws_instance.app.private_ip}"
}
