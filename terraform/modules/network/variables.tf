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

variable "create_subnet" {
  type    = bool
  default = true
}

variable "subnet_range" {
  type = string
}

variable "vpc_self_link" {
  description = "Self link da VPC já existente"
  type        = string
}