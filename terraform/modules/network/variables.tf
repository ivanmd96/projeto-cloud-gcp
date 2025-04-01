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

variable "subnet_range" {
  description = "Faixa de IPs da subrede"
  type        = string
  default     = "192.168.100.0/24"
}

variable "vpc_self_link" {
  description = "Self link da VPC já existente"
  type        = string
}

variable "create_subnet" {
  type    = bool
  default = true
}