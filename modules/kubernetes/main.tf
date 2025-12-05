resource "yandex_kubernetes_cluster" "k8s-master" {
    name = var.master_name
    network_id = var.master_network_id
    
    master {
        zonal {
            zone = var.master_zone
            subnet_id = var.master_subnet_id
        }
        public_ip = var.is_master_public
    }
    service_account_id = var.master_service_account_id
    node_service_account_id = var.nodes_service_account_id

}

resource "yandex_kubernetes_node_group" "k8s-node" {
  cluster_id = yandex_kubernetes_cluster.k8s-master.id
  name = var.nodes_name
  
  instance_template {
    platform_id = var.nodes_node_platform_id

    resources {
      memory = var.nodes_node_memory
      cores = var.nodes_node_cores
    }

    boot_disk {
      type = var.nodes_node_disk_type
      size = var.nodes_node_disk_size
    }

    network_interface {
      subnet_ids = var.nodes_subnets
    }
  }

  scale_policy {
    fixed_scale {
      size = var.nodes_scale_size
    }
  }
}
