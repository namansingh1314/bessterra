
name: Terraform CI/CD

on:
  push:
    branches: [ main ]
  workflow_dispatch:
    inputs:
      destroy:
        description: 'Trigger destroy?'
        required: false
        default: 'false'

jobs:
  terraform:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Code
      uses: actions/checkout@v3

    - name: Set up Docker
      uses: docker/setup-buildx-action@v2

    - name: Build Docker Image
      run: docker build -t terraform-app .

    - name: Terraform Init
      run: docker run -v ${{ github.workspace }}:/app terraform-app terraform init

    - name: Terraform Plan
      run: docker run -v ${{ github.workspace }}:/app terraform-app terraform plan -out=tfplan

    - name: Terraform Apply
      if: ${{ github.event.inputs.destroy != 'true' }}
      run: docker run -v ${{ github.workspace }}:/app terraform-app terraform apply -auto-approve tfplan

    - name: Terraform Destroy (Manual Trigger)
      if: ${{ github.event.inputs.destroy == 'true' }}
      run: docker run -v ${{ github.workspace }}:/app terraform-app terraform destroy -auto-approve
