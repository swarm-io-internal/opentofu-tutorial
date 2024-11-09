# main.tf in the root configuration directory

provider "aws" {
  region = "us-west-2"
}

module "my_ec2_instance" {
  source         = "./ec2_instance_module"
  ami            = "ami-0b72821e2f351e396" # Specify your AMI ID
  instance_type  = "t2.micro"
  instance_name  = "myname-tofu"
  instance_state = "running"
}

output "ec2_instance_id" {
  value = module.my_ec2_instance.instance_id
}

output "ec2_instance_public_ip" {
  value = module.my_ec2_instance.public_ip
}