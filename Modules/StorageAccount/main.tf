locals {
  diagnostic_setting_log_analytics_workspace_id = "/subscriptions/1db25687-69f8-41dc-845f-2958b094e631/resourceGroups/P1/providers/Microsoft.OperationalInsights/workspaces/NateLogWS1"
}

resource "azurerm_storage_account" "storageaccount" {
  name                      = var.azurerm_storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  min_tls_version           = var.min_tls_version
  enable_https_traffic_only = true
  is_hns_enabled            = true

  queue_properties  {
+   logging {
        delete                = true
        read                  = true
        write                 = true
        version               = "1.0"
        retention_policy_days = 10
    }
  }

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }
}

resource "azurerm_storage_encryption_scope" "example" {
  name               = "microsoftmanaged"
  storage_account_id = azurerm_storage_account.example.id
  source             = "Microsoft.Storage"
}

resource "azurerm_monitor_diagnostic_setting" "queue_diag" {
  name                        = "queue_diag"
  target_resource_id          = "${module.azurerm_storage_account.storageaccount.id}/queueServices/default"
  storage_account_id          = data.azurerm_storage_account.example.id
  log_analytics_workspace_id  = local.diagnostic_setting_log_analytics_workspace_id

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
  
  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
     category = "Transaction"

     retention_policy {
       enabled = false
     }
   }
}