resource "yandex_vpc_network" "default" {
    name = "k8s-network"
}

resource "yandex_iam_service_account" "k8s-sa" {
  name = "kubernetes-service-account"
  folder_id = var.foler_id
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-node-agent" {
  folder_id = var.foler_id
  role = "k8s.node.agent"
  member = "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  folder_id = var.foler_id
  role = "k8s.clusters.agent"
  member = "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
}

resource "yandex_vpc_subnet" "default" {
    name = "k8s-subnet"
    network_id = yandex_vpc_network.default.id
    v4_cidr_blocks = ["10.0.0.0/24"]
}

resource "yandex_iam_service_account" "externaldns" {
  name = "externaldns"
  folder_id = var.foler_id
}


resource "yandex_resourcemanager_folder_iam_member" "dns-editor" {
  folder_id = var.folder_id
  role = "dns.editor"
  member = "serviceAccount:${yandex_iam_service_account.externaldns.id}"
}


module "k8s" {
  source "modules/kubernetes"

  master_name = var.master_name
  master_zone = var.master_zone
  master_subnet_id
  is_master_public
  master_service_account_id
  nodes_service_account_id
  nodes_name
  nodes_node_platform_id
  nodes_node_memory
  nodes_node_cores
  nodes_node_disk_type
  nodes_node_disk_size
  nodes_subnets
  nodes_scale_size
