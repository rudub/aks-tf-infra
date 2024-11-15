variable rg_group_name {
    type = string
    default = "rg"
    description = "name of resource group"
}

variable "rg_location" {
    type = string
    default = "eastus"
    description = "location of resources"
}

variable "acr_sku" {
    type = string
    default = "Standard"
    description = "Azure container registry SKU"
}

variable "vm_size" {
  type = string
  default = "Basic_A1"
  description = "VM Size for nodepool"
}

variable "custom_vm_size" {
    type = string
    default = "Basic_A1"
    description = "VM Size for nodepool"
}

variable "custom_node_name" {
    type = string
    default = "appsnode"
    description = "Nodepool Name"
}

variable "acr_name" {
    type = string
    default = "pocacr"
    description = "ACR name"
}

variable "node_count" {
    default = 2
}