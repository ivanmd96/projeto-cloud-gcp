variable "bucket_name" {
  description = "Nome do bucket para armazenar o state"
  type        = string
}

variable "bucket_location" {
  description = "Localização do bucket (ex: US, US-CENTRAL1)"
  type        = string
  default     = "US"
}
