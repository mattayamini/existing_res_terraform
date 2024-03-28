terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.loc
}

resource "azurerm_network_interface" "nic1" {
  name                = var.nic1
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.s1_id
    private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_windows_virtual_machine" "example-vm" {
  name                = "${var.vm_name}"
  computer_name   =     "example-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "${var.vm_size}"
  admin_username      = "${var.admin_usr}"
  admin_password      = "${var.admin_pswd}"
  network_interface_ids = [azurerm_network_interface.nic1.id,
  ]


  os_disk {
    caching              = "${var.os_disk_caching}"
    storage_account_type = "${var.os_disk_strg_acc}"
    
  }

  source_image_reference {
    publisher = "${var.src_img_pbl}"
    offer     = "${var.src_img_ofr}"
    sku       = "${var.src_img_sk}"
    version   = "${var.src_img_vrsn}"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.base_name}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "${var.strg_acc_tier}"
  account_replication_type = "${var.strg_acc_repli}"
  access_tier              = "${var.strg_acc_acs}"
}