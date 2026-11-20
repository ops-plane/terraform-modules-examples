variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "network_interface_id" {
  type = string
}

variable "boot_diagnostics_enabled" {
  type    = bool
  default = false
}

# Trusted Launch: needs a Gen2 image
variable "secure_boot_enabled" {
  type    = bool
  default = true
}

variable "vtpm_enabled" {
  type    = bool
  default = true
}

# needs the subscription's EncryptionAtHost feature registered, so off by default
variable "encryption_at_host_enabled" {
  type    = bool
  default = false
}

variable "os_disk_type" {
  type    = string
  default = "Standard_LRS"
}

variable "image_publisher" {
  type = string
}

variable "image_offer" {
  type = string
}

variable "image_sku" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
