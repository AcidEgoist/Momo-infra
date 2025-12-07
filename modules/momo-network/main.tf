data "yandex_vpc_network" "momo_network" {
    name = "default"
}

data "yandex_vpc_subnet" "momo_subnet" {
  for_each = var.instance_zones
  name = "${data.yandex_vpc_network.momo_network.name}-${each.key}"
}
