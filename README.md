### Explanation

- **Terraform Configuration**: Lists all the Terraform configuration files.
- **Ansible Environment**: Lists all the files and directories related to the Ansible environment.
- **Terraform Modules**: Lists all the Terraform module files.

###  README.md

```markdown
# BESS Project Structure

## Terraform Configuration

```plaintext
BESS
├── .terraform
│   ├── .terraform.lock.hcl
│   ├── function.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── terraform.tfstate
│   │   └── terraform.tfstate.backup
│   ├── variables.tf
│   └── vault.tf
Ansible Environment
├── ansible.env
│   ├── include
│   │   ├── ansi.yaml
│   │   ├── hosts.ini
│   │   └── readme.md
│   ├── lib
│   ├── scripts
│   │   ├── activate
│   │   ├── activate.bat
│   │   ├── Activate.ps1
│   │   ├── deactivate.bat
│   │   ├── pip.exe
│   │   ├── pip3.12.exe
│   │   ├── pip3.exe
│   │   ├── python.exe
│   │   ├── pythonw.exe
│   │   └── pyvenv.cfg
Terraform Modules
├── modules
│   ├── Cosmosdb
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── log_storage
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── SQL
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── Vm1
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── Vm2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── vpc
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
Pending: Dockerfile
