ssh_key_file = "~/.ssh/ycloud-personal-key.pub"
vm_user_data_file = "./ansible-cloud-init.yaml"

image_id = "fd8bnguet48kpk4ovt1u"
vm_platform_id = "standard-v1"

vm_base_name = "momo-store"
vm_zone = "ru-central1-a"
vm_cores = 2
vm_memory = 4
vm_nat = true
vm_env = ["dev","staging"]


