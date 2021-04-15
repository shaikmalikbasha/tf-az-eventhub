resource "azurerm_eventhub_namespace" "eventHubNamespace" {
  name                = var.eventHubNamespaceName
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = "Production"
  }
}

resource "azurerm_eventhub" "eventHubName" {
  name                = var.eventHubName
  namespace_name      = azurerm_eventhub_namespace.eventHubNamespace.name
  resource_group_name = azurerm_resource_group.rg.name
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_storage_account" "storageAccount" {
  name                     = var.storageAccount
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "Storage"
}

resource "azurerm_storage_container" "blobContainer" {
  name                  = var.eventsContainer
  storage_account_name  = var.storageAccount
  container_access_type = "private"
}
