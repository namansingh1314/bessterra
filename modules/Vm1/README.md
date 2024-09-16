Terraform Azure Virtual Machine Deployment
This project contains Terraform configurations to deploy an Azure Virtual Machine (VM) along with associated resources such as a Network Interface, Public IP, and Network Security Group (NSG).

Prerequisites
Terraform installed on your local machine.
An Azure account with sufficient permissions to create resources.
Files
main.tf: Contains the main Terraform configuration for deploying the Azure resources.
variables.tf: Defines the input variables used in the Terraform configuration.
outputs.tf: Specifies the outputs of the Terraform configuration.
Resources Created
Azure Virtual Machine
Network Interface
Public IP
Network Security Group (NSG)
Subnet Network Security Group Association
Variables
The following variables are defined in variables.tf:

Variable Name	Description	Type	Default Value
resource_group_name	The name of the resource group	string	
vm_name	The name of the virtual machine	string	
vm_size	The size of the virtual machine	string	
admin_username	The admin username for the virtual machine	string	
admin_password	The admin password for the virtual machine	string	
subnet_id	The ID of the subnet	string	
image_publisher	The publisher of the image	string	
image_offer	The offer of the image	string	
image_sku	The SKU of the image	string	
image_version	The version of the image	string	
location	The location of the resource group	string	
nsg_name	The name of the Network Security Group	string	example-nsg
ssh_source_ip_range	The source IP range allowed to SSH into the VMs	string	0.0.0.0/0
Outputs
The following outputs are defined in outputs.tf:

Output Name	Description
vm_id	The ID of the virtual machine
public_ip	The public IP address of the virtual machine
nic_id	The ID of the network interface
nsg_id	The ID of the Network Security Group
Usage
Clone the repository to your local machine.
Navigate to the project directory.
Initialize the Terraform configuration:
terraform init
Create a terraform.tfvars file to specify the values for the variables:
resource_group_name = "your-resource-group"
vm_name             = "your-vm-name"
vm_size             = "Standard_DS1_v2"
admin_username      = "your-admin-username"
admin_password      = "your-admin-password"
subnet_id           = "your-subnet-id"
image_publisher     = "Canonical"
image_offer         = "UbuntuServer"
image_sku           = "18.04-LTS"
image_version       = "latest"
location            = "East US"
Apply the Terraform configuration:
terraform apply
Confirm the apply action by typing yes when prompted.
Cleanup
To destroy the resources created by this Terraform configuration, run:

terraform destroy
Confirm the destroy action by typing yes when prompted.