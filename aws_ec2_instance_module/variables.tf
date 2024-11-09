# variables.tf in ec2_instance_module directory

variable "ami" {
  description = "The Amazon Machine Image (AMI) ID for the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The Name tag for the instance."
  type        = string
}

variable "instance_state" {
  description = "The desired state of the instance (e.g., running, stopped)."
  type        = string
  default     = "running"
}