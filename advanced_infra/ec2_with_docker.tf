resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  key_name      = "your-key-pair"
  tags = {
    Name = "my-ec2-instance"
  }

  # User data script to install Docker and run the container
  user_data = <<-EOF
    #!/bin/bash
    # Install Docker
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user

    # Log in to GHCR
    echo 'your-ghcr-token' | docker login ghcr.io -u your-ghcr-username --password-stdin

    # Pull and run the container
    docker pull ghcr.io/your-repo/your-image:latest
    docker run -d ghcr.io/your-repo/your-image:latest
  EOF
}