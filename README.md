# Jenkins + Terraform + Azure

This repo demonstrates how to deploy Azure resources using Jenkins and Terraform.

## Contents
- `Jenkinsfile` → Jenkins pipeline definition
- `terraform/` → Terraform IaC files

## Usage
1. Configure Jenkins with Azure Service Principal credentials.
2. Point Jenkins pipeline to this repo.
3. Run the pipeline → it will deploy a Resource Group and Storage Account.
Here’s a nice **diagram + description** you can drop straight into your `README.md` to visually explain how your Jenkinsfile works:

---

## 🔄 Pipeline Flow Diagram

```text
   ┌────────────┐        ┌──────────────┐        ┌───────────────┐        ┌───────────────┐
   │   GitHub   │  --->  │   Jenkins    │  --->  │   Terraform   │  --->  │     Azure      │
   └────────────┘        └──────────────┘        └───────────────┘        └───────────────┘
        |                     |                        |                        |
        |   Code Repo          |   Pipeline Stages      |   IaC Execution        |   Cloud Resources
        |   (Jenkinsfile +     |   (Init → Plan →       |   (init/plan/apply)    |   (RG, Storage, etc.)
        |   Terraform files)   |   Apply)               |                        |
```

---

## 📖 Jenkinsfile Summary

This Jenkinsfile defines a **CI/CD pipeline** that automates Azure deployments using Terraform:

- **Environment Setup**  
  - Injects Azure Service Principal credentials (`ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, `ARM_SUBSCRIPTION_ID`) securely from Jenkins.

- **Stages**  
  1. **Checkout Code** → Pulls the latest Terraform project from GitHub.  
  2. **Terraform Init** → Initializes Terraform, downloads providers, and prepares the working directory.  
  3. **Terraform Plan** → Creates an execution plan (`tfplan`) showing what changes will be made.  
  4. **Terraform Apply** → Applies the plan automatically, provisioning Azure resources.

- **Post Actions**  
  - On success → Prints ✅ “Terraform deployment completed successfully!”  
  - On failure → Prints ❌ “Terraform deployment failed. Check logs.”

---

## ✅ Benefits
- **Infrastructure as Code (IaC)** → Reproducible deployments.  
- **Secure** → Credentials managed by Jenkins, not hardcoded.  
- **Automated** → Every GitHub commit can trigger a deployment.  
- **Scalable** → Extend Terraform files to add VNets, NSGs, VMs, etc.  

---
