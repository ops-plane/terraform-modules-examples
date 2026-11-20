# network-security-group

A network security group with its rules, on a network interface. A building block of `windows-vm`; configures
no provider itself.

**Existing group:** with `existing = true` the group and its association are imported instead of created
(`import.tf`, Terraform ≥ 1.16): the group by its name in the resource group, the association as
`<NIC ID>|<NSG ID>`. Fill in the other inputs, rules too, as they are; the plan shows what would change.

**Rules:** each rule needs `source_address_prefix` and `destination_port_range`; the rest defaults to an inbound
TCP allow. An inbound allow from anywhere (`*`, `Internet`, `0.0.0.0/0`) to SSH (22) or RDP (3389) is refused
unless the rule sets `allow_public_admin_access = true`. Example: `name = "RDP"`, `priority = 300`,
`destination_port_range = "3389"`, `source_address_prefix = "10.0.0.0/24"`.
