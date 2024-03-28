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
module "ResourceGroup" {
  source = "./modules/ResourceGroup"
  virnet = "vnet-01"
  addrspace = "10.0.0.0/16"
  snet = "snet-01"
  saddrspace = "10.0.1.0/24"
}

module "VirtualMachine"{
  source = "./modules/VirtualMachine"
  rg_name = "res-02"
  loc = "East Us"
  nic1 = "nic-01"
  s1_id = module.ResourceGroup.subnet_id
  vm_name = "v_machine_1"
  vm_size = "Standard_B1s"
  admin_usr = "adminuser"
  admin_pswd = "P@$$w0rd1234!"
  os_disk_caching = "ReadWrite"
  os_disk_strg_acc = "Standard_LRS"
  src_img_pbl = "MicrosoftWindowsServer"
  src_img_ofr = "WindowsServer"
  src_img_sk = "2016-Datacenter"
  src_img_vrsn = "latest"
  base_name = "uniquestorage321"
  strg_acc_tier = "Standard"
  strg_acc_repli = "LRS"
  strg_acc_acs = "Hot"
}