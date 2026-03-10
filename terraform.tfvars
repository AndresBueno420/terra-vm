# Copy this file to terraform.tfvars and update the values.

vm_admin_password = "password"

# Restrict SSH to your own public IP in production, e.g. ["203.0.113.10/32"]
ssh_allowed_cidrs = ["0.0.0.0/0"]
