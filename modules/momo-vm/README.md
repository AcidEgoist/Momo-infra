# Momo Store VM Terraform Module

## Overview
This Terraform module provisions a virtual machine (VM) in Yandex Cloud with customizable configuration parameters. It allows you to define the VM's hardware specifications, network settings, and access credentials.

## Usage
```hcl
module "momo-vm" {
  source = "./modules/momo-vm"
  vm_ssh_key = file(var.ssh_key_file)
  vm_image_id = var.image_id
  vm_platform_id = var.vm_platform_id
  vm_name = var.vm_base_name
  vm_zone = var.YC_ZONE
  vm_user_data = file(var.vm_user_data_file)
  vm_subnet_id = module.momo-network.momo_subnets_map["${var.vm_zone}"].id
  vm_cores = var.vm_cores
  vm_memory = var.vm_memory
  vm_nat = var.vm_nat
  vm_env = ["prod","staging"]

  YC_CLOUD_ID = var.YC_CLOUD_ID
  YC_TOKEN = var.YC_TOKEN
  YC_FOLDER_ID = var.YC_FOLDER_ID
  YC_ZONE = var.YC_ZONE
}
```

## Inputs
| Name             | Description                                      | Type        | Default                          |
|------------------|--------------------------------------------------|-------------|----------------------------------|
| vm_zone          | Placement zone for Yandex Cloud                  | string      | `"ru-central1-a"`                |
| vm_platform_id   | VM CPU platform (e.g., `standard-v1`)            | string      | `"standard-v1"`                  |
| vm_core_number   | Number of CPU cores                              | number      | `2`                              |
| vm_memory        | Memory size in GB                                | number      | `4`                              |
| vm_image_id      | Boot image ID                                    | string      |                                  |
| subnet_id        | Subnet ID for network placement                  | string      |                                  |
| vm_ssh_key       | Public SSH key for VM access (username:key)      | string      | `""`                             |
| vm_nat           | Assign public IP for VM                          | bool        | `false`                          |
| vm_user_data     | Cloud-init VM's config                           | string      | `""`                             |
| vm_name          | VM's friendly name                               | string      |                                  |
| vm_env           | Environments mapping for VM's                    | set(string) |                                  |
| YC_CLOUD_ID      | Yandex.Cloud Cloud ID for YC provider            | string      |                                  |
| YC_TOKEN         | Yandex.Cloud Access Token for YC provider        | string      |                                  |
| YC_FOLDER_ID     | Yandex.Cloud Folder ID for YC provider           | string      |                                  |
| YC_ZONE          | Yandex.Cloud Availability Zone for YC provider   | string      |                                  |


## Outputs
| Name                      | Description                              |
|---------------------------|------------------------------------------|
| public_ip_address         | Public IPs for VMs                       |
| private_ip_address        | Private IPs for VMs                      |
| name                      | VMs names                                |


## Requirements
- Terraform v1.14.0+
- Yandex Cloud provider v0.174.0+
