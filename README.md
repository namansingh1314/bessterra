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
├── test
│   ├── main_test.go
│   ├── go.mod
│   └── go.sum

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
 Dockerfile
