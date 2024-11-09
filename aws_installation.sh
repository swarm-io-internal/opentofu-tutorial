#!/bin/bash

# Step 1: Download the AWS CLI installer
echo "Downloading AWS CLI installer..."
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"

# Step 2: Run the installer
echo "Installing AWS CLI..."
sudo installer -pkg AWSCLIV2.pkg -target /

# Step 3: Verify installation
echo "Verifying AWS CLI installation..."
which aws
aws --version

# Optional: Run aws configure to set up credentials and configuration
echo "Running aws configure. Please follow the prompts to set up your AWS credentials."
aws configure

# Cleanup: Optionally remove the installer package
rm AWSCLIV2.pkg
echo "Installation complete."