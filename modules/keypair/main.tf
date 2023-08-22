resource "aws_key_pair" "myKey" {
  key_name   = var.tag_name
  public_key = file("${path.module}/${var.file_name}")
}