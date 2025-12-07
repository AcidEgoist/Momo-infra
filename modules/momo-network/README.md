# Momo Store Network Terraform Module

## Overview
This Terraform module configures the Virtual Private Cloud network for Yandex Cloud instances. It retrives network and subnets for Cloud's availability zones.

## Usage
```hcl
module "momo-network" {
  source = "./modules/momo-network"
  
  instance_zones = toset([var.vm_zone])

  YC_CLOUD_ID = var.YC_CLOUD_ID
  YC_TOKEN = var.YC_TOKEN
  YC_FOLDER_ID = var.YC_FOLDER_ID
  YC_ZONE = var.YC_ZONE
}
```

## Outputs
| Name             | Description                              |
|------------------|------------------------------------------|
| momo_subnets_map | Subnets map             |

## Requirements
- Terraform v1.14.0
- Yandex Cloud provider v0.174.0
