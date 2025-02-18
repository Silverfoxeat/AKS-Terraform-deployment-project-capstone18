terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.15.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id   
  client_secret   = var.client_secret  
  tenant_id       = var.tenant_id     
  subscription_id = var.subscription_id  
}

variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

# terraform-azure-pipeline  is the name of the ( App Registration )
# permission for the App Registration 
# Owner under the subscription
# User access 
