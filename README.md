# OpenTofu Tutorial

Welcome to the **OpenTofu Tutorial**! This guide will walk you through provisioning an EC2 instance using OpenTofu (an open-source alternative to Terraform) and an OpenTofu module for reusable infrastructure management.

## Getting Started with GitHub Codespaces

Launch a pre-configured Codespace to start working with the OpenTofu tutorial instantly.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/swarm-io-internal/opentofu-tutorial?quickstart=1)

## Repository Structure

- **`infra/`**: Contains the `instance.tf` file, which is a simple EC2 example using OpenTofu.
- **`module/`**: Contains the reusable OpenTofu module files (`main.tf`, `variables.tf`, `outputs.tf`) for provisioning EC2 instances.
- **`main.tf` (root)**: Imports the module from the `module` folder and specifies configurations for the EC2 instance.

## Setup AWS CLI

1. **Launch a Codespace**: Initiate a Codespace from the [OpenTofu Tutorial repository](https://github.com/swarm-io-internal/opentofu-tutorial).
2. **Configure AWS Credentials**: In the Codespace terminal, run the following command to input your AWS credentials:
   ```bash
   aws configure
    ```

- Enter your **AWS Access Key ID**, **Secret Access Key**, **Region**, and **Output format** as prompted.

> **Tip**: Refer to this [guide on retrieving AWS Secret Keys](https://www.msp360.com/resources/blog/how-to-find-your-aws-access-key-id-and-secret-access-key/) if you need help.

## Verifying OpenTofu Installation

To check that OpenTofu is correctly installed, run:

```bash
tofu --version
```

This should display the OpenTofu version if the installation is successful.

## Using the Simple EC2 Example

1. **Navigate to the `infra/` directory**:
   ```bash
   cd infra/
    ```

2. **Initialize OpenTofu**:
   ```bash
   tofu init
    ```

3. **Plan the Infrastructure**:
   ```bash
   tofu plan
    ```
    Review the planned infrastructure changes.

4. **Apply the Configuration**:
    ```bash
    tofu apply
    ```
    This will create an EC2 instance based on the instance.tf configuration.

## Using the OpenTofu Module

The `module/` directory contains reusable infrastructure code for provisioning an EC2 instance. Here’s how to use it:

1. **Navigate to the root directory** (where `main.tf` imports the module):
   ```bash
   cd ..
   ```

2.	**Initialize, Plan, and Apply**:
Run the following commands to initialize and apply the module-based configuration:
    ```bash
    tofu init
    tofu plan
    tofu apply
    ```

## Additional Resources

- [OpenTofu Documentation](https://opentofu.dev/docs)
- [Terraform Tutorial](https://developer.hashicorp.com/terraform/tutorials)
- [Terraform Registry](https://library.tf)