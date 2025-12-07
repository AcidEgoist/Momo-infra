resource "yandex_compute_instance" "momo_vm" {
  for_each = var.vm_env

  name = "${each.key}-${var.vm_name}"
  platform_id = var.vm_platform_id
  zone = var.vm_zone

  resources {
    cores = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
    }
  }

  network_interface {
    subnet_id = var.vm_subnet_id
    nat = var.vm_nat
  }

  metadata = {
    user-data = var.vm_user_data
    ssh-keys = var.vm_ssh_key
  }

}
