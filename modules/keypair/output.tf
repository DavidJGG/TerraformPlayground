output "key_id" {
  value = aws_key_pair.myKey.id
}

output "name" {
  value = aws_key_pair.myKey.key_name
}