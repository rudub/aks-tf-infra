terraform {
    backend "azurerm" {
        resource_group_name = "tf-storage-rg"
        storage_account_name = "tfquest"
        container_name = "tfstatefile"
        key = "quest.terraform.tfstate"
    }
}