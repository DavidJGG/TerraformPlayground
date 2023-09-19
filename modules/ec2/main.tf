resource "aws_instance" "myec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  associate_public_ip_address = var.associate_public_ip_address

  ebs_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = var.volume_size
    device_name           = "/dev/xvda"
  }

  subnet_id = var.subnet_id

  key_name = var.key_name

  security_groups = var.security_groups

  user_data_base64 = var.user_data

  tags = {
    Terraform = true
    Name = var.name
  }

}
