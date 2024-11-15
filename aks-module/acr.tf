variable "create_acr" {
  type        = bool
  default     = false
  description = "Set to true to create a new ACR, false to use an existing one"
}

resource "random_pet" "azurerm_container_registry_name" {
  prefix = "poc"
}

resource "azurerm_container_registry" "acr" {
  count               = var.create_acr ? 1 : 0
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.quest.name
  location            = azurerm_resource_group.quest.location
  sku                 = var.acr_sku
  admin_enabled       = false
}

# Reference an existing ACR if `create_acr` is false
data "azurerm_container_registry" "acr" {
  count               = var.create_acr ? 0 : 1
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.quest.name
}

locals {
  acr_id = var.create_acr ? azurerm_container_registry.acr[0].id : data.azurerm_container_registry.acr[0].id
}

resource "azurerm_role_assignment" "aks_acr_binding" {
  scope                = local.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.quest.kubelet_identity[0].object_id
}