variable "master_name" {
    type = string
    description = "Name of Control Plane"
}

variable "master_zone" {
    type = string
    description = "Control Plane placement zone"
    default = "ru-central1-a"
}

variable "master_subnet_id" {
    type = string
    description = "Control Plane subet"
}

variable "is_master_public" {
    type = bool
    description = "Will be Control Plane be publicaly available"
}

variable "master_service_account_id" {
    type = string
    description = "Service Account id for Control Plane"
    nullable = false
}

variable "nodes_service_account_id" {
    type = string
    description = "Service Account id for Nodes"
    nullable = false
}

variable "nodes_name" {
    type = string
    description = "Nodes names"
}

variable "nodes_node_platform_id" {
    type = string
    description = "Nodes platform type"
}

variable "nodes_node_memory" {
    type = number
    description = "Nodes memory"
    default = 4
}

variable "nodes_node_cores" {
    type = number
    description = "Nodes cores amount"
    default = 2
}

variable "nodes_node_disk_type" {
    type = string
    description = "Nodes disk type"
}

variable "nodes_node_disk_size" {
    type = number
    description = "Nodes disk size"
    default = 20
}

variable "nodes_subnets" {
    type = list(string)
    description = "List of subnets for nodes"
}

variable "nodes_scale_size" {
    type = number
    description = "Number of nodes"
    nullable = false
}
