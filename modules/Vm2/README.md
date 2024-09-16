Usage for Second VM
Clone the repository to your local machine.
Navigate to the project directory.
Initialize the Terraform configuration:
terraform init
Create a terraform.tfvars file to specify the values for the variables:
resource_group_name = "your-resource-group"
vm2_name            = "your-second-vm-name"
vm_size             = "Standard_DS1_v2"
admin_username      = "your-admin-username"
admin_password      = "your-admin-password"
subnet_id           = "your-subnet-id"
image_publisher     = "Canonical"
image_offer         = "UbuntuServer"
image_sku           = "18.04-LTS"
image_version       = "latest"
location            = "East US"
vm2_nsg_name        = "example-vm2-nsg"
ssh_source_ip_range = "0.0.0.0/0"
Apply the Terraform configuration:
terraform apply
Confirm the apply action by typing yes when prompted.
Cleanup for Second VM
To destroy the resources created by this Terraform configuration for the second VM, run:

terraform destroy
Confirm the destroy action by typing yes when prompted.