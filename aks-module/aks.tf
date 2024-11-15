locals {
  tags = {
    Application = "AKS_Cluster"
    Environment = "Dev"
  }
}

resource "azurerm_resource_group" "quest" {
  name     = var.rg_group_name
  location = var.rg_location
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = "cluster"
}

resource "azurerm_kubernetes_cluster" "quest" {
  name                = random_pet.azurerm_kubernetes_cluster_name.id
  location            = azurerm_resource_group.quest.location
  resource_group_name = azurerm_resource_group.quest.name
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}
