output "ami" {
  value = aws_instance.myec2.ami
}

output "public_ip" {
  value = aws_instance.myec2.public_ip
}

output "private_ip" {
  value = aws_instance.myec2.private_ip
}

output "host_id" {
  value = aws_instance.myec2.host_id
}

output "ec2_id" {
  value = aws_instance.myec2.id
}

output "volume_tags" {
  value = aws_instance.myec2.volume_tags
}

output "public_dns" {
  value = aws_instance.myec2.public_dns
}
