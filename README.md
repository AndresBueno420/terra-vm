# Terra-vm

Terraform lab to deploy an Azure Linux VM with:
- Public IP
- NSG rule for SSH on port `22`
- Username/password authentication

## Module Structure

- Root module: `./`
- Reusable VM module: `./tf_modules/azure_linux_vm`

The root configuration calls the reusable module and passes values from `variables.tf`/`terraform.tfvars`.

## Prerequisites

- Terraform `>= 1.5`
- Azure CLI authenticated (`az login`)

## Initialize And Deploy

1. Create your variables file:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

2. Edit `terraform.tfvars` and set at least:
- `vm_admin_password` (strong password)
- `ssh_allowed_cidrs` (recommended: your public IP `/32`)

Example:

```hcl
vm_admin_password = "UseAStrongPassword123!"
ssh_allowed_cidrs = ["203.0.113.10/32"]
```

3. Initialize Terraform:

```powershell
terraform init
```

4. Review and apply:

```powershell
terraform plan
terraform apply
```

## Credentials And SSH Port

- Username: value of `vm_admin_username` (default: `andres`)
- Password: value of `vm_admin_password` from `terraform.tfvars`
- SSH port: `22` (allowed by NSG rule)

After apply, get connection info:

```powershell
terraform output vm_public_ip
terraform output vm_ssh_connection
```

Connect manually:

```bash
ssh andres@<VM_PUBLIC_IP> -p 22
```

## Notes

- For security, avoid `0.0.0.0/0` in `ssh_allowed_cidrs` outside of testing.
- Destroy resources when done:

```powershell
terraform destroy
```

Done:


<img width="776" height="595" alt="image" src="https://github.com/user-attachments/assets/d522f792-93e4-4b4d-9afb-0872eefadabe" />

