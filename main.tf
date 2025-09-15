terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = var.backend_key
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = terraform.workspace
  location = var.location
}


variable "backend_resource_group_name" {
  description = "Name of the resource group containing the storage account for remote backend."
  type        = string
}

variable "backend_storage_account_name" {
  description = "Name of the storage account for the remote backend."
  type        = string
}

variable "backend_container_name" {
  description = "Name of the blob container for the remote backend state file."
  type        = string
}

variable "backend_key" {
  description = "The name of the Terraform state file in the blob container."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
  default     = "eastus"
}
