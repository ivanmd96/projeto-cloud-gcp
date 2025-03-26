variable "vm_name" {
  description = "Nome da VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo da máquina"
  type        = string
}

variable "zone" {
  description = "Zona onde a VM será criada"
  type        = string
}

variable "vm_image" {
  description = "Imagem do SO da VM"
  type        = string
}

variable "ssh_key_path" {
  description = "Caminho da chave SSH pública"
  type        = string
}

variable "network" {
  description = "ID da VPC"
  type        = string
}

variable "subnetwork" {
  description = "ID da subrede"
  type        = string
}
