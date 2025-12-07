variable "YC_TOKEN" {
  description = "IAM-token for YandexCloud"
  type        = string
  sensitive   = true
}

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
}

variable "ssh_key_file" {
  type = string
  description = "SSH key for VM access"
  #sensitive = true
  default = ""
}

variable "image_id" {
  type = string
  description = "VM's boot iamge id"
}

variable "vm_platform_id" {
  type = string
  description = "VM's CPU platform"
}

variable "vm_base_name" {
  type = string
  description = "VMs names prefix"
}

variable "vm_zone" {
  type = string
  description = "VM's availability zone placement"
  default = "ru-central1-a"
}

variable "vm_user_data_file" {
  type = string
  description = "Cloud-init config for VMs"
  default = ""
}

variable "vm_cores" {
  type = number
}

variable "vm_memory" {
  type = number
}

variable "vm_nat" {
  type = bool
}

variable "vm_env" {
  type = set(string)
  default = ["dev","staging"]
}
