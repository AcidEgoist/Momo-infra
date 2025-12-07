output "public_ip_address" {
  value = {
    for name, vm in yandex_compute_instance.momo_vm :
    name => lookup(vm.network_interface.0, "nat_ip_address", null)
  }
}

output "private_ip_address" {
  value = {
    for name, vm in yandex_compute_instance.momo_vm :
    name => vm.network_interface.0.ip_address
  }
  description = "VM's public address"
}

output "name" {
  value = yandex_compute_instance.momo_vm[*]
}