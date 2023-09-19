output "ec2_dns" {
  value = [
    "ssh -i '${module.keyPair.name}.pem' ubuntu@${module.ec2_1.public_dns}",
    "ssh -i '${module.keyPair.name}.pem' ubuntu@${module.ec2_2.public_dns}",
    "ssh -i '${module.keyPair.name}.pem' ubuntu@${module.ec2_3.public_dns}"
  ]
}

output "ec2_public_ip" {
  value = [
    module.ec2_1.public_ip,
    module.ec2_2.public_ip,
    module.ec2_3.public_ip
  ]
}

output "ec2_private_ip_dns" {
  value = [
    module.ec2_1.private_ip,
    module.ec2_2.private_ip,
    module.ec2_3.private_ip
  ]
}

output "keyPair_name" {
  value = module.keyPair.name
}
