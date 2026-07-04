variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "tf-jenkins-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "tfjenkinsstorageacct"
}
