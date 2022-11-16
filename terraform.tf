terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.42.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "ded428d7-241d-4830-9051-6edf075ecbd1"
  tenant_id       = "dc229684-729d-4937-b991-bb1730a25e01"
  features {}
}

resource "azurerm_resource_group" "RG_MBA_Infra" {
  name     = "RG_MBA_Infra"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "default"
  location            = "eastus"
  resource_group_name = "RG_MBA_Infra"
  dns_prefix          = "teste-k8s"


  default_node_pool {
    name            = "labmba"
    node_count      = 2
    vm_size         = "Standard_B2ms"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "53a11a01-f838-4098-8de2-5c37db5761bf"
    client_secret = "Rst8Q~hkI2~g~CH5TnVyCkmOIAMKtKyoJFrwVdos"
  }
}

resource "azurerm_" "name" {
  
}
