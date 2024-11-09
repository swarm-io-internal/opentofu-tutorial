# Running a Docker Container on an EC2 Instance with OpenTofu

This guide explains two methods for deploying a Docker container on an EC2 instance created with OpenTofu, focusing on using a container image hosted on the GitHub Container Registry (GHCR). Each approach has unique advantages and disadvantages, and the recommended choice is explained below.

## Approach 1: User Data Script

### Description
The **User Data Script** runs commands on the EC2 instance at boot. In this approach, the script installs Docker, logs in to GHCR, and pulls and runs the specified Docker container.

### Advantages
- **Simplicity**: Runs automatically when the instance starts, with no need for SSH configuration.
- **Reliability**: Executes directly on the instance at boot, so it doesn’t rely on external SSH access, reducing setup complexity.
- **Scalability**: Easily replicated across multiple instances, as each instance automatically runs the user data script.
- **Idempotent for Initial Setup**: AWS only runs the user data script once per instance lifecycle, which is ideal for one-time setup.

### Disadvantages
- **Limited Feedback**: You won’t get real-time feedback during execution, which can make debugging initial setup issues more challenging.
- **No Re-run on Restart**: If the instance is stopped and started again, the user data script won’t run a second time, so any updates need to be done manually or through a separate process.

## Approach 2: Remote-Exec Provisioner

### Description
The **Remote-Exec Provisioner** uses SSH to connect to the instance after creation and run commands to install Docker, log in to GHCR, and start the container.

### Advantages
- **Real-Time Feedback**: Allows real-time output, which is useful for debugging and tracking each command’s success.
- **Flexible for Updates**: Useful for updating an existing instance since commands can be executed anytime by running the provisioner again.

### Disadvantages
- **More Complex Setup**: Requires SSH configuration, including managing keys and access.
- **Dependency on SSH Connection**: If SSH connectivity issues arise, the setup may fail or need manual intervention.
- **Not Scalable**: Running commands via SSH provisioners is more suited for individual instances rather than a fleet of instances.

## Recommended Approach: User Data Script

For this use case—automating Docker setup and container deployment on a new EC2 instance from GHCR—the **User Data Script** is the recommended approach. Its simplicity, reliability, and ease of scaling make it ideal for initial instance setup. By executing commands at boot, the instance is immediately ready to run the Docker container without requiring further interaction or configuration.

This approach is especially useful if you plan to launch multiple instances, as each will automatically execute the setup steps on initialization.