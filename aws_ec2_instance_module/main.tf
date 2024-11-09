# main.tf in ec2_instance_module directory

# Specify the EC2 instance resource
resource "aws_instance" "tutorial_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

# Manage the instance state (e.g., start, stop)
resource "aws_ec2_instance_state" "tutorial_instance_state" {
  instance_id = aws_instance.tutorial_instance.id
  state       = var.instance_state
}