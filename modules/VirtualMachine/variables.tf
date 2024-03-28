variable "rg_name"{
    description = "name of the resource group"
    type = string
}

variable "loc"{
    description = "location of the resource group"
    type = string
}

variable "nic1"{
    type = string
    description ="name of the nic1"
}
variable "s1_id"{
    description = "subnet id"
    type = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  #default     = "V-machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  #default     = "Standard_B1s"
}

variable "admin_usr" {
  description = "Admin username for the virtual machine"
  type        = string
  #default     = "adminuser"
}

variable "admin_pswd" {
  description = "Admin password for the virtual machine"
  type        = string
  #default     = "P@$$w0rd1234!"
}

variable "os_disk_caching" {
  description = "Caching type for the OS disk"
  type        = string
  #default     = "ReadWrite"
}

variable "os_disk_strg_acc" {
  description = "Storage account type for the OS disk"
  type        = string
  #default     = "Standard_LRS"
}

variable "src_img_pbl" {
  description = "Publisher of the source image"
  type        = string
  #default     = "MicrosoftWindowsServer"
}

variable "src_img_ofr" {
  description = "Offer of the source image"
  type        = string
  #default     = "WindowsServer"
}

variable "src_img_sk" {
  description = "SKU of the source image"
  type        = string
  #default     = "2016-Datacenter"
}

variable "src_img_vrsn" {
  description = "Version of the source image"
  type        = string
  #default     = "latest"
}

variable "base_name" {
    type = string
    description = "The storage accuont base name"
}

variable "strg_acc_tier" {
  description = "Storage account tier"
  type        = string
  #default     = "Standard"  # Options: "Standard", "Premium"
}

variable "strg_acc_repli" {
  description = "Replication type for the storage account"
  type        = string
  #default     = "LRS"  # Options: "LRS", "GRS", "ZRS", "RA-GRS", "GZRS", "RA-GZRS"
}

variable "strg_acc_acs" {
  description = "Access tier for the storage account"
  type        = string
  #default     = "Hot"  # Options: "Hot", "Cool"
}