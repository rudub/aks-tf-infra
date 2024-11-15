resource "azurerm_kubernetes_cluster_node_pool" "spot_nodes" {
    name = "spot"
    kubernetes_cluster_id = azurerm_kubernetes_cluster.quest.id
    vm_size = var.vm_size
    spot_max_price = 0.5
    priority = "Spot"
    eviction_policy = "Delete"
    node_labels = {
        "kubernetes.azure.com/scalesetpriority" = "spot"
    }
    node_taints = [
        "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
    ]
}