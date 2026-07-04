# Jenkins + Terraform + Azure

This repo demonstrates how to deploy Azure resources using Jenkins and Terraform.

## Contents
- `Jenkinsfile` → Jenkins pipeline definition
- `terraform/` → Terraform IaC files

## Usage
1. Configure Jenkins with Azure Service Principal credentials.
2. Point Jenkins pipeline to this repo.
3. Run the pipeline → it will deploy a Resource Group and Storage Account.
