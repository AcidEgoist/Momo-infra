# Momo Store Infrastructure Terraform Config

## Overview
This Terraform Config configures the Yandex Cloud for Momo Store infrastructure. It creates VM's for specified environments and creates dns records.

## Usage
```hcl
module "momo_vm" {
  source = "./modules/momo-vm"
  
  <map all module variables with required values and set required environments>
}

module "momo-network" {
  source = "./modules/momo-network"
  
  instance_zones = toset([var.vm_zone])

  YC_CLOUD_ID = var.YC_CLOUD_ID
  YC_TOKEN = var.YC_TOKEN
  YC_FOLDER_ID = var.YC_FOLDER_ID
  YC_ZONE = var.YC_ZONE
}

data "yandex_dns_zone" "momo_store" {
  name = "<dns_zone_name>"

}

resource "yandex_dns_recordset" "prod" {
  zone_id = data.yandex_dns_zone.momo_store.id
  name = "<DNS A record>"
  type = "A"
  ttl = 200
  data = [module.momo_vm.public_ip_address["prod"]]
}

resource "yandex_dns_recordset" "staging" {
  zone_id = data.yandex_dns_zone.momo_store.id
  name = "DNS A record"
  type = "A"
  ttl = 200
  data = [module.momo_vm.public_ip_address["staging"]]
}

```


## Inputs
| Name              | Description                                      | Type        | Default                          |
|-------------------|--------------------------------------------------|-------------|----------------------------------|
| vm_zone           | Placement zone for Yandex Cloud                  | string      | `"ru-central1-a"`                |
| vm_platform_id    | VM CPU platform (e.g., `standard-v1`)            | string      | `"standard-v1"`                  |
| vm_cores          | Number of CPU cores                              | number      | `2`                              |
| vm_memory         | Memory size in GB                                | number      | `4`                              |
| image_id          | Boot image ID                                    | string      |                                  |
| subnet_id         | Subnet ID for network placement                  | string      |                                  |
| ssh_key-file      | Path for public SSH key file                     | string      | `""`                             |
| vm_nat            | Assign public IP for VM                          | bool        | `false`                          |
| vm_user_data_file | Path for cloud-init VM's config  file            | string      | `""`                             |
| vm_base_name      | VM's base for name                               | string      |                                  |
| vm_env            | Environments mapping for VM's                    | set(string) | `["dev","staging"]`              |
| YC_CLOUD_ID       | Yandex.Cloud Cloud ID for YC provider            | string      |                                  |
| YC_TOKEN          | Yandex.Cloud Access Token for YC provider        | string      |                                  |
| YC_FOLDER_ID      | Yandex.Cloud Folder ID for YC provider           | string      |                                  |
| YC_ZONE           | Yandex.Cloud Availability Zone for YC provider   | string      |                                  |


## Outputs
| Name               | Description                              |
|--------------------|------------------------------------------|
| public_ip_address  | Public IPs for VMs                       |
| private_ip_address | Private IPs for VMs                      |


## Requirements
- Terraform v1.14.0
- Yandex Cloud provider v0.174.0