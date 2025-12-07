module "momo_vm" {
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
  vm_env = var.vm_env
  
  YC_CLOUD_ID = var.YC_CLOUD_ID
  YC_TOKEN = var.YC_TOKEN
  YC_FOLDER_ID = var.YC_FOLDER_ID
  YC_ZONE = var.YC_ZONE
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
  name = "personal-dns-zone"

}

# resource "yandex_dns_recordset" "prod" {
#   zone_id = data.yandex_dns_zone.momo_store.id
#   name = "momo-store"
#   type = "A"
#   ttl = 200
#   data = [module.momo_vm.public_ip_address["prod"]]
# }
#
# resource "yandex_dns_recordset" "staging" {
#   zone_id = data.yandex_dns_zone.momo_store.id
#   name = "staging-momo-store"
#   type = "A"
#   ttl = 200
#   data = [module.momo_vm.public_ip_address["staging"]]
# }
