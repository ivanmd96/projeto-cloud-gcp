variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
  default     = "projeto-cloud-estudo"
}

variable "region" {
  description = "Região onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zona onde a VM será criada"
  type        = string
  default     = "us-central1-a"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
  default     = "projeto-cloud"
}

variable "subnet_name" {
  description = "Nome da subrede"
  type        = string
  default     = "subnet-projeto-cloud"
}

variable "subnet_range" {
  description = "Faixa de IPs da subrede"
  type        = string
  default     = "10.10.0.0/24"
}

variable "vm_name" {
  description = "Nome da VM"
  type        = string
  default     = "vm-projeto-cloud"
}

variable "machine_type" {
  description = "Tipo da máquina"
  type        = string
  default     = "e2-medium"
}

variable "vm_image" {
  description = "Imagem do SO da VM"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "ssh_key_path" {
  description = "Caminho do arquivo da chave pública SSH"
  type        = string
  default     = "chave.pub"
}
