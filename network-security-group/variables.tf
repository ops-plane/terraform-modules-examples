variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "network_interface_id" {
  type = string
}

variable "rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = optional(string, "Inbound")
    access                     = optional(string, "Allow")
    protocol                   = optional(string, "Tcp")
    source_port_range          = optional(string, "*")
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = optional(string, "*")
    description                = optional(string, "")
    allow_public_admin_access  = optional(bool, false) # opt-in: inbound allow from anywhere to 22 or 3389
  }))
  default = []

  validation {
    # shortcut: reads destination_port_range ("*", a port or a range) only; extend if the rule gets port lists
    condition = alltrue([for r in var.rules : r.allow_public_admin_access || !(
      lower(r.direction) == "inbound" && lower(r.access) == "allow" &&
      contains(["*", "any", "internet", "0.0.0.0/0", "::/0"], lower(r.source_address_prefix)) &&
      anytrue([for p in [22, 3389] : r.destination_port_range == "*" || try(
        p >= tonumber(split("-", r.destination_port_range)[0]) && p <= tonumber(reverse(split("-", r.destination_port_range))[0]),
      false)])
    )])
    error_message = "An inbound allow rule from anywhere (*, Internet, 0.0.0.0/0) to SSH (22) or RDP (3389) needs allow_public_admin_access = true; restrict source_address_prefix instead."
  }
}

variable "existing" {
  type        = bool
  description = "The network security group exists already, on this network interface: import it and its association instead of creating them."
  default     = false
}
