# Changelog

## [2.0.0](https://github.com/ops-plane/terraform-modules-examples/compare/storage-account-v1.0.0...storage-account-v2.0.0) (2026-11-20)


### ⚠ BREAKING CHANGES

* **windows-vm,linux-vm,storage-account:** a VM deployed with the old defaults (no Trusted Launch) is replaced on the next apply unless secure_boot_enabled and vtpm_enabled are set to false; a Gen1 image needs both false. A storage account's shared key access is switched off unless shared_access_key_enabled = true.

### Features

* **windows-vm,linux-vm,storage-account:** Trusted Launch on, encryption at host, storage without shared keys and with soft delete ([5712788](https://github.com/ops-plane/terraform-modules-examples/commit/5712788f07707706f318e823d396289b68060c0a))

## [1.0.0](https://github.com/ops-plane/terraform-modules-examples/compare/storage-account-v0.1.0...storage-account-v1.0.0) (2026-11-13)


### ⚠ BREAKING CHANGES

* **storage-account:** subnet_id is replaced by subnet_name, vnet_name and vnet_resource_group_name.

### Features

* **storage-account:** the subnet by name in the subscription's standard network ([c022a68](https://github.com/ops-plane/terraform-modules-examples/commit/c022a686c3740aafbbafeb13dcee31c8305fe032))


### Bug Fixes

* **storage-account:** require Terraform 1.16.1, which imports from a module ([e5d0efa](https://github.com/ops-plane/terraform-modules-examples/commit/e5d0efa0920ea64b19b04e8ec852699b2cca0eb7))

## 0.1.0 (2026-11-13)


### Features

* **storage-account:** storage account behind a private endpoint, imports itself ([7372645](https://github.com/ops-plane/terraform-modules-examples/commit/7372645d6aca6b36f03cd134c3154f2aeee11afb))
* **storage-account:** storage account behind a private endpoint, imports itself ([3ffb544](https://github.com/ops-plane/terraform-modules-examples/commit/3ffb5440b5198b85b6494e1eba9bc623d056c73b))
