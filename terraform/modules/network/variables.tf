variable "region" {
  description = "Região onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
  default     = "projeto-cloud"
}

variable "subnet_name" {
  description = "Nome da subrede"
  type        = string
  default     = "projeto-1"
}

output "subnet_id" {
  value = var.create_subnet ? google_compute_subnetwork.subnet[0].id : null
}

variable "create_subnet" {
  type    = bool
  default = true
}

variable "subnet_range" {
  type = string
}