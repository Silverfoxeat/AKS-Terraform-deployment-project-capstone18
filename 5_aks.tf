
# Managed Identity 
###################
resource "azurerm_user_assigned_identity" "base1" {
  name                = "base"
  location            = azurerm_resource_group.hipaa_rsg.location
  resource_group_name = azurerm_resource_group.hipaa_rsg.name
}

resource "azurerm_role_assignment" "base2" {
  scope                = azurerm_resource_group.hipaa_rsg.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.base1.principal_id
}

# Azure kubenetent Cluster Block
resource "azurerm_kubernetes_cluster" "hipaa_k8s" {
  name                = "${local.env}-${local.eks_name}"
  location            = azurerm_resource_group.hipaa_rsg.location
  resource_group_name = azurerm_resource_group.hipaa_rsg.name
  dns_prefix          = "devaks1"

  kubernetes_version        = local.eks_version
  private_cluster_enabled   = false
  node_resource_group       = "${local.resource_group_name}-${local.env}-${local.eks_name}"


  # For production change to "Standard" 
  sku_tier = "Free"

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.20.10"
    service_cidr   = "10.0.20.5/24"
  }

  default_node_pool {
    name                 = "general"
    vm_size              = "Standard_D2_v2"
    vnet_subnet_id       = azurerm_subnet.subnet1.id
    orchestrator_version = local.eks_version
    type                 = "VirtualMachineScaleSets"
    node_count           = 1
    

    node_labels = {
      role = "general"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.base1.id]
  }

  tags = {
    env = local.env
  }

  lifecycle {
    ignore_changes = [default_node_pool[0].node_count]
  }

  depends_on = [
    azurerm_role_assignment.base2
  ]
}