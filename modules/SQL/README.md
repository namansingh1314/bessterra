Usage for SQL Server and Azure Managed Grafana
Clone the repository to your local machine.
Navigate to the project directory.
Initialize the Terraform configuration:
terraform init
Create a terraform.tfvars file to specify the values for the variables:
resource_group_name = "your-resource-group"
location            = "East US"
sql_server_name     = "your-sql-server-name"
sql_admin_username  = "your-sql-admin-username"
sql_admin_password  = "your-sql-admin-password"
sql_database_name   = "your-sql-database-name"
grafana_name        = "your-grafana-name"
Apply the Terraform configuration:
terraform apply
Confirm the apply action by typing yes when prompted.
Cleanup for SQL Server and Azure Managed Grafana
To destroy the resources created by this Terraform configuration, run:

terraform destroy
Confirm the destroy action by typing yes when prompted.