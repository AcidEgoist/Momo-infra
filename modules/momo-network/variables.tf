variable "instance_zones" {
    type = set(string)
    description = ""
    default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}

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
  sensitive   = true
}
