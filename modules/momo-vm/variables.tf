variable "YC_CLOUD_ID" {
  description = "YandexCloud default Cloud ID"
  type        = string
  sensitive   = true
}

variable "YC_FOLDER_ID" {
  description = "YandexCloud default Folder ID"
  type        = string
  sensitive   = true
}

variable "YC_ZONE" {
  description = "YandexCloud default zone"
  type        = string
  default     = "ru-central1-a"
  sensitive   = true
}

variable "YC_TOKEN" {
  description = "IAM-token for YandexCloud"
  type        = string
  sensitive   = true
}

variable "vm_zone" {
  type = string
  description = "VM's placement zone"
  nullable = true
}

variable "vm_platform_id" {
  type = string
  description = "VM's CPU platform"
  nullable = false
}

variable "vm_cores" {
  type = number
  description = "VM's number of cores"
  default = 2
}

variable "vm_memory" {
  type = number
  description = "VM's number of memory"
  default = 4
}

variable "vm_image_id" {
  type = string
  description = "VM's boot image"
  nullable = false
}

variable "vm_subnet_id" {
  type = string
  description = "VM's subnet placement"
  nullable = false
}

variable "vm_nat" {
  type = bool
  description = "VM NAT enabled?"
  default = false
}

variable "vm_user_data" {
  type = string
  description = "Cloud-init VM's config"
  default = ""
}

variable "vm_ssh_key" {
  type = string
  description = "Public SSH key for VM"
  default = ""
}

variable "vm_name" {
  type = string
  description = "VM's friendly name"
}

variable "vm_env" {
  type = set(string)
}
