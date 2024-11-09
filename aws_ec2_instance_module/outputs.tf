# outputs.tf in ec2_instance_module directory

output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.tutorial_instance.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.tutorial_instance.public_ip
}

output "instance_state" {
  description = "The current state of the EC2 instance."
  value       = aws_ec2_instance_state.tutorial_instance_state.state
}