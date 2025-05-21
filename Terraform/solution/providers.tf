terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options

  features {

  }

  subscription_id = "XXXXXXX" # --->> out you azure subscription_id HERE
}