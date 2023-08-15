resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = var.subnets_id
  desired_capacity   = var.desired
  max_size           = var.max
  min_size           = var.min

  launch_template {
    id      = var.template_id
    version = var.versionLT
  }
}