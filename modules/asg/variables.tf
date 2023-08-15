variable "subnets_id" {
    description = "var.subnets_id"
    nullable = false
}
variable "desired" {
    default = 1
}
variable "max" {
    default = 1
}
variable "min" {
    default = 1
}
variable "template_id" {
    description = "var.template_id"
    nullable = false
}
variable "versionLT" {
    default = "$Latest"
}