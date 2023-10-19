terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
         version = "3.76.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#Use ResourceGroup
resource "azurerm_resource_group" "aks-rg" {
  name = "aks-rg"
  location = "eastus2"
}

#Create KubernetesCluster
resource "azurerm_kubernetes_cluster" "aks-smartesting" {
    name = "aks-smartesting"
    location = azurerm_resource_group.aks-rg.location
    resource_group_name = azurerm_resource_group.aks-rg.name
    dns_prefix = "aks-smartesting"

    default_node_pool {
        name = "default"
        node_count = 2
        vm_size = "Standard_D2_v2"
    }

    identity {
        type = "SystemAssigned"
    }
  
}






