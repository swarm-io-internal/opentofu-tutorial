# Specify the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Virginia servers
}

# Create a t2.micro EC2 instance
resource "aws_instance" "tutorial_instance" { # Note that the ami-0b72821e2f351e396 image is NOT available in west regions
  ami           = "ami-0b72821e2f351e396" # Amazon Machine Image (AMI); https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html
  instance_type = "t2.micro" # EC2 Instance; https://aws.amazon.com/ec2/instance-types/

  tags = {
    Name = "<myname>-tofu" # Change to your name, so we can see all the instances online
  }
}

# Manage the instance state (e.g., start, stop)
resource "aws_ec2_instance_state" "tutorial_instance_state" {
  instance_id = aws_instance.tutorial_instance.id
  state       = "running" # Set to "stopped" if you want to stop the instance instead of running it
}
