# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Specify Terraform version
terraform {
  required_version = ">= 1.3.0" # Ensure using Terraform 1.3.0 or later
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = ">= 1.20.0"
    }
  }
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "novi-education"
  location = "North Europe"
}

# Create a Storage Account
resource "azurerm_storage_account" "st" {
  name                     = "noviprojectst"  
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

# Create an Azure Databricks Workspace
resource "azurerm_databricks_workspace" "dbx" {
  name                = "novidbxworkspace"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                 = "premium"
}

# Create an Azure Data Factory
resource "azurerm_data_factory" "adf" {
  name                = "novidatafactory"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
}

