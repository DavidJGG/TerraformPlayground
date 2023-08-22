output "ami" {
  value = aws_instance.myec2.ami
}

output "public_ip" {
  value = aws_instance.myec2.associate_public_ip_address
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