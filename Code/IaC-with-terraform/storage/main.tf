# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "novi-education"
  location = "North Europe"
}

# Create a Storage Account
resource "azurerm_storage_account" "st" {
  name                     = "noviprojectst"  #  
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
}

# Create Blob Storage Containers
resource "azurerm_storage_container" "incoming" {
  name                  = "incoming"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "cleaned" {
  name                  = "cleaned"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "curated" {
  name                  = "curated"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}
