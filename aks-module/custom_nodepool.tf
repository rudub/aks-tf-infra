resource "azurerm_kubernetes_cluster_node_pool" "custom_nodepool" {
    name = var.custom_node_name
    vm_size = var.custom_vm_size
    kubernetes_cluster_id = azurerm_kubernetes_cluster.quest.id
    node_count = var.node_count
    tags = local.tags
}